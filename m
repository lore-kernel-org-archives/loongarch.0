Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E81426D0C
	for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694095; cv=none; b=ZheMzS6UNgW+UiuFjKwNwnHYzf3bz3gfaZBV/eds+EJz6xQPK5W6L8AxOrxyEnw0I3KODionQd0Rf7KW9iTbCClnFu0ne27cBIfdW/H+gzr6XYLqFKpGMhWfW3NFwtx8vbqeo2XCY+mRRu2V8rUZ6K8osHFL21Tye39XKo67suY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694095; c=relaxed/simple;
	bh=q0w/AxRhjWQE4dIpmJxYHduJuCU5IVKkf9Qu1zHWt8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y/7hT3iemcbA2M/BO7REvvYJWguDo0GRUtMpsCL/MuQIUGsXEm5dEqjdqtaYrmIxsXu0WVw0ijVAR14zUdlTA2IDMaQFuqJp9GSi3UuShj65U9Qv5BaCERvoKZ+hH8MmigSZuY3CeapVwXFTsf6vROdGdoJK/ZeTquteAmb9OQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACXa+_JyX5qeX2eBQ--.2121S2;
	Fri, 14 Aug 2026 15:54:49 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] LoongArch: defconfig: enable generic I2C slave support
Date: Fri, 14 Aug 2026 15:54:49 +0800
Message-ID: <20260814075449.14912-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXa+_JyX5qeX2eBQ--.2121S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1DWr4furWxWFykXr1xuFg_yoW8Zr1kpw
	1xZw4DJF4rWF1fCa9rC34kWa90yasrGry7WF1YyF1UCrZ7Z34UZr18tF4UWFsFg393KrW0
	9F93KF9xtFWUK37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2YLD
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The DesignWare I2C slave object is now controlled by the generic
CONFIG_I2C_SLAVE symbol. The LoongArch defconfigs still set the removed
CONFIG_I2C_DESIGNWARE_SLAVE symbol.

Use the current generic symbol so the intended DesignWare slave support
continues to be built.

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260624081618.93699-1-pengpeng@iscas.ac.cn/
- no source-code changes
- rebase both LoongArch defconfigs
- add the coding-assistant disclosure

The current Kconfig object mapping was reviewed statically; no LoongArch
kernel build was performed.

 arch/loongarch/configs/loongson32_defconfig | 2 +-
 arch/loongarch/configs/loongson64_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
index 7c8f01513ed2..7672e77bab1e 100644
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -728,7 +728,7 @@ CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_PIIX4=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_SLAVE=y
+CONFIG_I2C_SLAVE=y
 CONFIG_I2C_DESIGNWARE_PCI=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
index 8e3906d3bd70..65afcd8a7ba5 100644
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -750,7 +750,7 @@ CONFIG_TCG_LOONGSON=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_PIIX4=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_SLAVE=y
+CONFIG_I2C_SLAVE=y
 CONFIG_I2C_DESIGNWARE_PCI=y
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_LS2X=y
-- 
2.50.1 (Apple Git-155)

