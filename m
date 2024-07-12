Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAA01422DE
	for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720775712; cv=none; b=mVjPP2gGa5maQd4GTbcEJfqtsDuRcis7jjHEDrIalHzHu/xqWEs62scFxIHlvKb9Oe4NIiysf8V0QvGbw0Ndg8G5hTSF523UmDscfluZ6BXxpnh0/nvJVUly0ylL4Mop/qP3Gjt9L9s9mqBRVsoUrmgdjrV3RufVFDvdeSEn3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720775712; c=relaxed/simple;
	bh=gDAtlrQb7pwC0IsoMxHtpOR67LxVHX2NBX/p2+oALsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDAm0roMwtQs389QeePicD4yq4EaBjZ2rR06Ayn8gFW3CKkG8ibwDf2wizhGxqAdYB2iaMYy0hjc36YuaxSMvqxgZY5z4FL8OX9NVsiUYLuCA0lmthnB2uC0TloZmXRqMdG1xrgfUe9gG4QG7jFV9uhnsO8zkTbnBKM3rPYsSsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxO_Ac9JBmIaEDAA--.10455S3;
	Fri, 12 Jul 2024 17:15:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXcca9JBmW65FAA--.28188S2;
	Fri, 12 Jul 2024 17:15:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/4] Add jump table support for objtool on LoongArch
Date: Fri, 12 Jul 2024 17:15:02 +0800
Message-ID: <20240712091506.28140-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXcca9JBmW65FAA--.28188S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFy8GF17ZF1rGFWUZF1DJwc_yoWkJFg_Wr
	92g34kG3yrZFyjgFy0qr1fXryUKFWkJrn8GFyDXr1xtr15Arn8uFZrJ34YvF1Fg3yFqFs8
	JrW0yry8C3s2yosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcZXoDUUUU

This RFC version is based on Linux 6.10-rc7, there are no detailed
commit messages for each patch for now and the code are relatively
clear and simple.

This series is tested with the latest upstream gcc applied with patch
"LoongArch: Add support to annotate tablejump" [1] which adds a new
section discard.tablejump_annotate to record the jump info, it makes
life much easier, special thanks to Ruoyao.

I will address all the review comments and update the commit messages
after the merge window.

[1] https://inbox.sourceware.org/gcc-patches/20240711114415.4420-1-xry111@xry111.site/

Tiezhu Yang (4):
  objtool: Check local label in find_jump_table()
  objtool: Check various types in add_jump_table()
  objtool/LoongArch: Add support for jump table
  LoongArch: Remove -fno-jump-tables for objtool

 arch/loongarch/Kconfig                 |  8 +++-
 arch/loongarch/Makefile                |  6 +--
 tools/objtool/arch/loongarch/special.c | 54 +++++++++++++++++++++++++-
 tools/objtool/check.c                  | 36 +++++++++++++++--
 4 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.42.0

