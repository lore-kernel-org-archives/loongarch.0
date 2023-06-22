Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66F715AE5
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 14:13:44 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxXccVV5Rk7nMAAA--.773S3;
	Thu, 22 Jun 2023 22:13:42 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ80TV5RkZSsCAA--.10045S2;
	Thu, 22 Jun 2023 22:13:40 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 0/2] Unify uapi bitsperlong.h
Date: Thu, 22 Jun 2023 22:13:37 +0800
Message-Id: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxJ80TV5RkZSsCAA--.10045S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4rXFy3Kr4UKF17tr45CFX_yoW8tr15pF
	93ArnxWF45CrWay3yrJa40qryUA397Gr4jgay2qry8XrWIvF1UGrsY9rs3Ca47GayUXFn5
	uF9xGry5Ga1DK3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EksDUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

v3:
  -- Check the definition of __BITS_PER_LONG first at
     the beginning of uapi/asm-generic/bitsperlong.h

v2:
  -- Check __CHAR_BIT__ and __SIZEOF_LONG__ rather than
     __aarch64__, __riscv, __loongarch__, thanks Ruoyao
  -- Update the code comment and commit message

v1:
  -- Rebase on 6.4-rc6
  -- Only unify uapi bitsperlong.h for arm64, riscv and loongarch
  -- Remove uapi bitsperlong.h of hexagon and microblaze in a new patch

Here is the RFC patch:
https://lore.kernel.org/linux-arch/1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn/

Tiezhu Yang (2):
  asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch
  tools arch: Remove uapi bitsperlong.h of hexagon and microblaze

 arch/arm64/include/uapi/asm/bitsperlong.h          | 24 -------------------
 arch/loongarch/include/uapi/asm/bitsperlong.h      |  9 --------
 arch/riscv/include/uapi/asm/bitsperlong.h          | 14 -----------
 include/uapi/asm-generic/bitsperlong.h             | 13 ++++++++++-
 tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 -------------------
 tools/arch/hexagon/include/uapi/asm/bitsperlong.h  | 27 ----------------------
 .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
 .../arch/microblaze/include/uapi/asm/bitsperlong.h |  2 --
 tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -----------
 tools/include/uapi/asm-generic/bitsperlong.h       | 14 ++++++++++-
 tools/include/uapi/asm/bitsperlong.h               |  6 -----
 11 files changed, 25 insertions(+), 131 deletions(-)
 delete mode 100644 arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/riscv/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/hexagon/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/microblaze/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

-- 
2.1.0

