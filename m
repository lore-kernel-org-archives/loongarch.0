Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E524284B58
	for <loongarch@lists.linux.dev>; Tue, 12 Aug 2025 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005248; cv=none; b=ktiyrp+wxEtN9pKC80oTsuGl7Ro40s3QBmxRnFu/WIa1ZUF0IChz2J8/SV+djOPM1MAO+TIB7OlTvEX5GaA14pu3xQ2IZbNrZmR1XHysnYUVUDFrwrZc13smEhIYMinHqYUbpwPVXQX3ZtSl4aKo18ws7CgtGjx3ebUSeXYTidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005248; c=relaxed/simple;
	bh=tngOegCMF2+ifcukaZaIpv4er4BJ1QQq8DzIk3OXdD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJT8dJUbNiQ4M0MiFUzHEO61iCBabCp6Nkx8+u6KXEczdh+W1WzHyp3YP/bcl89WzlYgB9SwcK+G3JzRro6MCy6IDX158SKX8N5x1EDDO4WXQPI4njMqDBDUdMtTiNvb6OrAMThNpK+2d0ksgkmMyqq9v5STofiDTl+cOzkeptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxPOI4QZtoG_g+AQ--.13095S3;
	Tue, 12 Aug 2025 21:27:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxdOQ0QZtoOLVGAA--.6029S2;
	Tue, 12 Aug 2025 21:27:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix objtool warnings if LTO is enabled for LoongArch
Date: Tue, 12 Aug 2025 21:27:14 +0800
Message-ID: <20250812132716.1465-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdOQ0QZtoOLVGAA--.6029S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw4xuw1ftw13KFy8Aw4rCrX_yoWfCFb_Jr
	1fG34kG3yUua1DtayIgF9Ygryqga18Xrn8JF1IqryfCw13AwsrGw4jqw15Zr1vkayUJrs8
	GrWkZFy8uw12yosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

The patch #1 should be a preparation for patch #2, that is to say,
the patch #2 is dependent on the patch #1, otherwise there is build
error if LTO is enabled after only applying patch #2.

With this series, most of warnings have been silenced, only remains
the following warning by now, it needs more analysis:

  vmlinux.o: warning: objtool: __efistub_efi_boot_kernel() falls through
  to next function __efistub_exit_boot_func()

How to reproduce:

  $ make ARCH=loongarch LLVM=1 clean defconfig
  $ scripts/config -d LTO_NONE -e LTO_CLANG_THIN
  $ make ARCH=loongarch LLVM=1 olddefconfig all

Tiezhu Yang (2):
  objtool/LoongArch: Get table size correctly if LTO is enabled
  LoongArch: Pass annotate-tablejump option if LTO is enabled

 arch/loongarch/Makefile                |  6 ++++++
 tools/objtool/arch/loongarch/special.c | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.42.0

