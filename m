Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0377C169AD2
	for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722320352; cv=none; b=DmwnJsiQFtDZPFg6/u6gvT0xGeXfLBtdyZSoP6l+uzWLCvhtD8qJljb4vQhT27p6GaEaGIVrRuzDO1T7lFnMb/RTEBAxin+YllqPpWx0HofraMz0e9aNuuFnmSfKWmAPtwOtDE/C3sqEfrhPd4VPgdENNdLJziMRafBLhTALVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722320352; c=relaxed/simple;
	bh=tH7L+Uo2XulclK4GUmSG9W19Epj7O2ocH6t9sgBPLKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/A7R7K7G5T/Gbg2ZGaHStxgw+Vnc+bUZFjSeXx0UFIEEju8tS2Eo4CetQ3VoeDcnrvr8dsFuZ2sSnwwUNsGTickVBjr2I5S56iyg8zvXTIWuqF6iKxONs68bti7SmxEEad6zrDFK6MLsIvSKG+7889AesgVHqAkG5skjTuLpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxh+nVhahmyEMEAA--.13493S3;
	Tue, 30 Jul 2024 14:19:01 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAxX8fVhahmehYGAA--.30051S2;
	Tue, 30 Jul 2024 14:19:01 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix objtool warning about do_syscall() on LoongArch
Date: Tue, 30 Jul 2024 14:18:59 +0800
Message-ID: <20240730061901.21485-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxX8fVhahmehYGAA--.30051S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

Tiezhu Yang (2):
  objtool/LoongArch: Restrict stack operation instruction
  LoongArch: Remove STACK_FRAME_NON_STANDARD(do_syscall)

Tiezhu Yang (2):
  objtool/LoongArch: Restrict stack operation instruction
  LoongArch: Remove STACK_FRAME_NON_STANDARD(do_syscall)

 arch/loongarch/kernel/syscall.c       | 4 ----
 tools/objtool/arch/loongarch/decode.c | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.42.0

