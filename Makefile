.PHONY: default build run clean
# Nome do executável
TARGET = quo

# Pastas
SRC_DIR = src
BUILD_DIR = build

# Arquivos fonte (todos os .d dentro de src/)
SRC = $(wildcard $(SRC_DIR)/*.d)

# Compilador
DC = dmd

# Flags de compilação
DFLAGS = -O -release


# Alvo padrão (não compila)
default:
	@echo "Use 'make build' para compilar, 'make run' para executar, ou 'make clean' para limpar."

# Compilar (gera executável dentro de build/)
build: $(SRC)
	mkdir -p $(BUILD_DIR)
	$(DC) $(DFLAGS) $(SRC) -of=$(BUILD_DIR)/$(TARGET)

# Executar
run: build
	./$(BUILD_DIR)/$(TARGET)

# Limpar (remove tudo dentro da pasta build)
clean:
	rm -rf $(BUILD_DIR)/*
