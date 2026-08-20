Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2014457A4
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230223; cv=none; b=dYtkQ2ZlxKRf60b7ZE6L1j/b+mgZavcpvUJZpoP6NKNFZIoqZPI1FZatLjXbW4C7CPkhsWWfSJMEuS6bkFBrLGnPDxfei+pVwE0lr2NtQ8GizXdgHAKb3Lg5JI2aE9RWcfNznckiOcYwykM7P0tCca8QqQPbp27IOLZsDA0OmZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230223; c=relaxed/simple;
	bh=t/wqrQG7mh/bLDGlXi3QvBm9+4nZZM3xHgnq1Ct3iO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nwIgIF/O0X+RD+8OiedbzoJRK7q7sjXHd1pNtENvTk42ZV0p0pGQjw4uehtxuV/vEIEPxs6drHUq9SfyoP8gZuuPEac/T6Ew9vC/lbZemFdQpVndKECTJRO7mdZ5JfVrVaeNUQW5L5HzuWGe4qMNC2N5zBs0VstFG2RrMEtWyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxW_AD+IZqVh0DAA--.9435S3;
	Thu, 20 Aug 2026 20:50:11 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx2c0A+IZqX_QLAA--.6716S2;
	Thu, 20 Aug 2026 20:50:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-modules@vger.kernel.org,
	loongarch@lists.linux.dev,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH v4 0/3] Ignore local labels and mapping symbols during module load
Date: Thu, 20 Aug 2026 20:50:04 +0800
Message-ID: <20260820125007.22943-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx2c0A+IZqX_QLAA--.6716S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1DKFWDuFWrJryDGw48uFX_yoW8Xw13pF
	43CF43Xr4UZr97Can7Gw4j9Fy5u3ykXr4FgF13Gw1xAF1qq3W8Zr92kr1F934UAryUKF40
	vr17A3yqga48AwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

This series prevents compiler generated local labels and mapping symbols
from leaking into /proc/kallsyms for loaded modules. This ensures tracing
tools like bpftrace can resolve accurate kernel stacks on architectures
like LoongArch.

Based on the latest modules-next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/log/?h=modules-next

There are many discussions in the previous version, here is the link:
https://lore.kernel.org/loongarch/20260812032807.15034-1-yangtiezhu@loongson.cn/

v4:
  (1) Use is_ignored_kernel_symbol() and update
      tools/perf/util/symbol.h in patch #1
  (2) Keep using is_core_symbol() in patch #2
  (3) Update commit messages of the three patches

Cc the maintainers of the updated non-module files:
  (1) Josh Poimboeuf <jpoimboe@kernel.org> -- scripts/faddr2line
  (2) Nathan Chancellor <nathan@kernel.org> -- scripts/mod/modpost.h
  (3) Namhyung Kim <namhyung@kernel.org> -- tools/perf/util/symbol.h

Tiezhu Yang (3):
  module/kallsyms: Rename is_mapping_symbol() to
    is_ignored_kernel_symbol()
  module/kallsyms: Refactor current symbol filtering into
    is_core_symbol()
  module/kallsyms: Ignore local labels and mapping symbols during module
    load

 include/linux/module_symbol.h |  7 +++--
 kernel/module/kallsyms.c      | 59 ++++++++++++++++++-----------------
 scripts/faddr2line            |  2 +-
 scripts/mod/modpost.h         |  2 +-
 tools/perf/util/symbol.h      |  4 +--
 5 files changed, 39 insertions(+), 35 deletions(-)

-- 
2.42.0

