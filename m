Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C4938837C
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 03:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505300; cv=none; b=HWlGOuN1tT8NoK/3g9/26SmrzTYWLJngQ8xlvLZAze8aqbtBkaXvwA7FXFs7iw32hoZ2NrRFyR96D6a+D5zU0xE4C5B61XcBqI94MBAGh4TbxHFXVaq1f6BVIb8kd1mkkrkxIOdLZ5PBCZ8h6huQ0sq2YqRluFLvWD+P9l2We2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505300; c=relaxed/simple;
	bh=LMeVbo/jILdHh3k2XeAvSmtPFPvCwjvSnzqY0Oi9unE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUCNA9llyS1ORhshtZ54sICtfsI+ZQeU42nFGlVTkJjQw1eR2evtUMLBBq/N2Srqp3qwpTNGksJuUTaVQ1Ftx8JUA2qusPL8Dj0NVGbb5LMi8mqSEvDLdJf0iZCtXug2Ly2b25SnScI3tez3kxpFG6jHhnDbpNRr8Cp5teUQdGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxhvBK6HtqNmwAAA--.1394S3;
	Wed, 12 Aug 2026 11:28:10 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs9J6HtqfoUBAA--.10453S2;
	Wed, 12 Aug 2026 11:28:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-modules@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Filter out local and mapping symbols during module load
Date: Wed, 12 Aug 2026 11:28:04 +0800
Message-ID: <20260812032807.15034-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPs9J6HtqfoUBAA--.10453S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWruFWUuw48GF1fZF18JF1DJwc_yoWfWrc_WF
	yxGFW5Cr47Ga97uFW8trn5XryS9a15G3yDAa4vqF47A3s5Ar43tFs2yrWIgr17XF18Zr4S
	yFnFva4kZwnFgosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

This series prevents compiler generated local and mapping symbols
from leaking into /proc/kallsyms for loaded modules. This ensures
tracing tools like bpftrace can resolve accurate kernel stacks on
architectures like LoongArch.

Based on the v2 discussion, the changes are now refactored into a
clean three-patch series to eliminate code duplication and clarify
naming.

Tiezhu Yang (3):
  module/kallsyms: Rename is_mapping_symbol() to
    is_local_mapping_symbol()
  module/kallsyms: Refactor current symbol filtering into
    is_kept_symbol()
  module/kallsyms: Filter out local and mapping symbols during module
    load

 include/linux/module_symbol.h |  4 +--
 kernel/module/kallsyms.c      | 59 ++++++++++++++++++-----------------
 scripts/faddr2line            |  2 +-
 scripts/mod/modpost.h         |  2 +-
 4 files changed, 35 insertions(+), 32 deletions(-)

-- 
2.42.0

