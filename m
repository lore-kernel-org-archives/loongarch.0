Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF191C9ED2
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021154; cv=none; b=Ub/Uq16CKPI8gnce72ywzauRMYeN9qmduyeYsz9hYUag5f+co5V4P7JFRopfJ8gbLtbz0lytjZubq//Pmg9Q9lp+QjPA70+w7eao/WbUAiHNl+LldYk4jfSdm3r4Ivmo4qsHSPCSWAniPud13wAmQkK80/OzA/B5vXnjMJL7LJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021154; c=relaxed/simple;
	bh=aDLSs3jcaYViLbBjSbU8F3tnbR37g0VeBK80Qd0aUi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPpe00siKgpXg2voNyLYhFw9FKmUsNW9E6f8Xi2SezPElU0J7feojz9oKpME4hE3idXD9b4z093E9IBheoJGsK5NSnpFobFaUnxrmSSkfXdfnAhIa3jz4/wq9F1DH7pmglnQV5DCMb4owXywEKTJMM6dT+fL2mkgCEdPVsQf8Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax2eleN7Nm1S8KAA--.31731S3;
	Wed, 07 Aug 2024 16:59:10 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxvmdaN7NmO8EHAA--.24061S5;
	Wed, 07 Aug 2024 16:59:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] LoongArch: Set AS_HAS_THIN_ADD_SUB as y if AS_IS_LLVM
Date: Wed,  7 Aug 2024 16:59:05 +0800
Message-ID: <20240807085906.27397-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240807085906.27397-1-yangtiezhu@loongson.cn>
References: <20240807085906.27397-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxvmdaN7NmO8EHAA--.24061S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw43tw1xtF4xXF4DZF4rXrc_yoW8Xr4xpw
	42vwn5AFW8WF48AFWDJ3yFg398Jr97Kay2grW7KFWrC398ZrWj9a47trnxKF1UKw4kt3yS
	qr4fCw1aga98JabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

When building kernel with "make CC=clang defconfig", LLVM Assembler
is used due to LLVM_IAS=0 is not specified, then AS_HAS_THIN_ADD_SUB
is not set, thus objtool can not be built after enable it for Clang.

config AS_HAS_THIN_ADD_SUB is to check whether -mthin-add-sub option is
available to know R_LARCH_{32,64}_PCREL are supported for GNU Assembler,
there is no this option for LLVM Assembler. The minimal version of Clang
is 18 for building LoongArch kernel, and Clang >= 17 already supports
R_LARCH_{32,64}_PCREL, that is to say, there is no need to depend on
AS_HAS_THIN_ADD_SUB for Clang, so just set AS_HAS_THIN_ADD_SUB as y if
AS_IS_LLVM.

Fixes: 120dd4118e58 ("LoongArch: Only allow OBJTOOL & ORC unwinder if toolchain supports -mthin-add-sub")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 70f169210b52..e1b6cb306d4d 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -265,7 +265,7 @@ config AS_HAS_FCSR_CLASS
 	def_bool $(as-instr,movfcsr2gr \$t0$(comma)\$fcsr0)
 
 config AS_HAS_THIN_ADD_SUB
-	def_bool $(cc-option,-Wa$(comma)-mthin-add-sub)
+	def_bool $(cc-option,-Wa$(comma)-mthin-add-sub) || AS_IS_LLVM
 
 config AS_HAS_LSX_EXTENSION
 	def_bool $(as-instr,vld \$vr0$(comma)\$a0$(comma)0)
-- 
2.42.0

