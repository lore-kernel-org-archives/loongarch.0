Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E5F1FBC85
	for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274627; cv=none; b=m9dm2ACl/2LDXI16dwOFrl4juQd8YDlJ/OUncAzxdUnUT1b/MbuKXyumpCOWSEFb7O+Q/SD7pA/61wFDJlWgINY0wwBzX4Jsbutw8GAjM1a29IkcI44m9dw2ZDSjNoA73bMDpddAFo30x/NDiG0NXocBUOsUCJkku1V+aAZgXoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274627; c=relaxed/simple;
	bh=MpYoV935gHCdfwmOkYgd2Ig/wcyVybBMA8FMdECu/nI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXUNALnKaQJsAeOPDBS5d10QgILQAa69p9mGTffwTfkbn5xdH+rT5OeaUYaloaPeYBDjLW1JFvR6ZoxwQFRQAW6IohSIpac6SHT4T4Bw+CuIvBArVwH6cFRL6WZAv9ZAcox3k6aWOz+O3Z2cmuuwcuLcpZZs6qKVFISVooBeoGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxHHJ8OatnTSJyAA--.2019S3;
	Tue, 11 Feb 2025 19:50:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MR6OatnNPMLAA--.43600S2;
	Tue, 11 Feb 2025 19:50:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/7] Add jump table support for objtool on LoongArch
Date: Tue, 11 Feb 2025 19:50:09 +0800
Message-ID: <20250211115016.26913-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MR6OatnNPMLAA--.43600S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw4kKFWruFy8Kr1rGr4UGFX_yoWkuFg_uF
	1xWa4kGr1rXa1jqa4Dtr1rury0yF4rJFs5CFyUXw17uF15Xr1UGFWav34DZrn8KrZ5uFsx
	JrWFyry8CwsF9osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_Wryl
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jz2NtUUUUU=

This version is based on tip/tip.git master branch [1], the patch
"objtool: Handle unreachable entry of rodata" is dropped, tested
with the latest mainline Binutils, GCC and Clang (2025-02-11).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=master

Tiezhu Yang (7):
  objtool: Handle various symbol types of rodata
  objtool: Handle different entry size of rodata
  objtool: Handle PC relative relocation type
  objtool/LoongArch: Add support for switch table
  objtool/LoongArch: Add support for goto table
  LoongArch: Enable jump table for objtool
  LoongArch: Convert unreachable() to BUG()

 arch/loongarch/Kconfig                        |   3 +
 arch/loongarch/Makefile                       |   6 +-
 arch/loongarch/kernel/machine_kexec.c         |   4 +-
 tools/objtool/arch/loongarch/decode.c         |  28 ++-
 .../objtool/arch/loongarch/include/arch/elf.h |   7 +
 tools/objtool/arch/loongarch/special.c        | 159 +++++++++++++++++-
 tools/objtool/arch/powerpc/decode.c           |  15 ++
 tools/objtool/arch/x86/decode.c               |  13 ++
 tools/objtool/check.c                         |  23 ++-
 tools/objtool/include/objtool/arch.h          |   3 +
 10 files changed, 247 insertions(+), 14 deletions(-)

-- 
2.42.0

