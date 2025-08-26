Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A762D3A9E
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 06:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756190814; cv=none; b=ok5BHEu1cmrl15VzlQODr/BZ8Qw93e2CpKKgRtNwydCd1+0eoVoFz/m+DDitU+iHrXx4DXGK5HH+y5I5ZvhuCHRJz3Rw8LT/i62/UEwPI+HRnvXwC4PmaZPqXdDLRnifagXcMZRIewh3CzE9eKIPuBNPl4zlS/flOJy0DlbUuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756190814; c=relaxed/simple;
	bh=PJYcrW3146tg0jQ2dAlNuAr1YSgbWZab7/BLli09X04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdgoOTrsGbmKe6oFaIFQhiY9az3AcZlTAd6+gn4HHG/jlQH9mFL5zKhy6zSrKA4A0ltLVgGRVY/lP6+dv0hHWzlA6w/BeL84ykr7b239Bu6tc5jbon5G37F0ndKn2b2UajWkJ8rNIoV9E7AWe+zuOgJmRGAsOvBcaI6N1R0mJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9NQWK1oHkEDAA--.6243S3;
	Tue, 26 Aug 2025 14:46:40 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxTMFKWK1o6GppAA--.11160S2;
	Tue, 26 Aug 2025 14:46:34 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Fix objtool warnings if LTO is enabled for LoongArch (Part 2)
Date: Tue, 26 Aug 2025 14:46:29 +0800
Message-ID: <20250826064631.9617-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxTMFKWK1o6GppAA--.11160S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWruF4UZF47Ar1DXryxWF4ftFc_yoWkCwb_ur
	yS9F1xGrW7Cw4Fgw1UKFZxZFy7Ka40gryDAr92grW2g34fC3WDCanrGr13Ar10gFZ7JrZ8
	GrWv9r18ZwnFgosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7MmhUUUUU

The previous series is to fix most of the warnings (total 3030):

  sibling call from callable instruction with modified stack frame

This series is a follow up to fix 2 kinds of warnings (total 24), it only
touches the LoongArch related code:

  falls through to next function
  unreachable instruction

With this series, there is only 1 kind of warning (total 3), it does not
only touch the LoongArch related code:

  missing __noreturn in .c/.h or NORETURN() in noreturns.h

In order to silence the above warnings, it needs to change the related
code to give the functions __noreturn attribute, and have a NORETURN()
annotation in tools/objtool/noreturns.h. IMO, it will touch all of the
archs and the generic code, so this needs much more work to avoid the
side effect or regression, once it is done I will send out the patch.

Tiezhu Yang (2):
  objtool/LoongArch: Fix fall through warning about efi_boot_kernel()
  objtool/LoongArch: Fix unreachable instruction warnings about head.S

 arch/loongarch/kernel/head.S             | 8 ++++----
 drivers/firmware/efi/libstub/loongarch.c | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.42.0

