Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53ED322547
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417474; cv=none; b=liDnrePoDvRzHYQS+1+1hCLlgZp1lXz6SUFbrAFpeEiBsQ9gBo5blUm1n5xKi4nt+Xgs9dWCF7eV+a6F9TTyd+VD0d7P/02w2vovmoCru3hgnJwNRQOKn0yMuP5jMK7XQRNPdsq/KNLeOUyRJoxBZCYoQ5KNaIhmo3lPIXLeFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417474; c=relaxed/simple;
	bh=4mZ2zwX4COPPyKSVGRqkeqFFxo/eJVFLLK7KT40nWZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjeMnHSgjnpXBTxx3iGkPOdAZymDcjsAMB5YUzyAVIKCBuJxeZ9UeNGRqx/3Y+7doN8v2xJTVlSaJIh6rQ3MX03fzMFNlrbzQwyvcnolfvXrVUqVTlY2YElmF8bjI1UVULc/xY4n0bUi9FlaFNDap/pShDVQRXIX461hPnAIzJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx+tH7D8BosVoIAA--.17979S3;
	Tue, 09 Sep 2025 19:31:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxjcH7D8BoviGKAA--.57546S2;
	Tue, 09 Sep 2025 19:31:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Zhang <zhangxi@kylinos.cn>,
	live-patching@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Debug and fix livepatch issues on LoongArch
Date: Tue,  9 Sep 2025 19:31:04 +0800
Message-ID: <20250909113106.22992-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxjcH7D8BoviGKAA--.57546S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCF54CYxVAaw2AFwI0_Jrv_JF1l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7tx6UUUUU

When testing the kernel live patching, there is a timeout over 15 seconds,
debug and fix the issues on LoongArch.

Tiezhu Yang (2):
  livepatch: Add config LIVEPATCH_DEBUG to get debug information
  LoongArch: Return 0 for user tasks in arch_stack_walk_reliable()

 arch/loongarch/kernel/stacktrace.c | 10 ++++++++++
 kernel/livepatch/Kconfig           |  8 ++++++++
 kernel/livepatch/transition.c      |  4 ++++
 3 files changed, 22 insertions(+)

-- 
2.42.0

