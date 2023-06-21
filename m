Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFEF2AB2B
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 08:39:12 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxvscvt5JkrBEAAA--.112S3;
	Wed, 21 Jun 2023 16:39:11 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c4st5JkmlAAAA--.2097S2;
	Wed, 21 Jun 2023 16:39:09 +0800 (CST)
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
Subject: [PATCH v2 0/2] Unify uapi bitsperlong.h
Date: Wed, 21 Jun 2023 16:39:06 +0800
Message-Id: <1687336748-4898-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8Ax3c4st5JkmlAAAA--.2097S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr48Jr1fWw43WFWDury7twc_yoW8ur1DpF
	93ArnxWF45CrWayw1rta4jqryUJ397Gr4jgay2qry8XrWIvF1UGrsYkrs3Ca47JayUXFn5
	urn3Gry5G3WDK3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcyxRUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

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
 include/uapi/asm-generic/bitsperlong.h             | 11 +++++++++
 tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 -------------------
 tools/arch/hexagon/include/uapi/asm/bitsperlong.h  | 27 ----------------------
 .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
 .../arch/microblaze/include/uapi/asm/bitsperlong.h |  2 --
 tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -----------
 tools/include/uapi/asm-generic/bitsperlong.h       | 12 ++++++++++
 tools/include/uapi/asm/bitsperlong.h               |  6 -----
 11 files changed, 23 insertions(+), 129 deletions(-)
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

