Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A72481B1
	for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 03:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737516197; cv=none; b=hGfke9GhNR4H+5heORP9oj+L1pjxv0uXe5DaFImWjFowBITi/4BUWKH3W/QbtSZl1KUghcGQPDlKv8GxGdeV7Tgc07HO29nKqlw/KaiJAtV0B+YpN+E4CN5ONuYkDKzRSd3X2xB+Sjq+La3Lts0Q+sTIfL5weWBd0pL81HvSTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737516197; c=relaxed/simple;
	bh=UXF22T5x2KlqLeL1KSKrLqZxfbi2B3D6KB7dy5gXPOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GafWia+QtS6kScQf0FwxNJr+iW2MABFtx6d4ZN93DPqe+YL6T62yjLwf0WOdqTasSqWE5Hg60YMpL7ljppfwFK3zQ6pWhvFUZWc6U8YW1MXY1l//t+36FmFBPxCb2NcEnNqMtCRSibw2QY7b+pFV4JSUTteF3+kuh99IqLvuEd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axjq+gZJBnTQhnAA--.46819S3;
	Wed, 22 Jan 2025 11:23:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAx+8SfZJBnfi8qAA--.30584S2;
	Wed, 22 Jan 2025 11:23:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] LoongArch: Change the maximum number of watchpoints
Date: Wed, 22 Jan 2025 11:23:08 +0800
Message-ID: <20250122032310.26729-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx+8SfZJBnfi8qAA--.30584S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrWFWxCFykZrW8GFWUXr1fuFX_yoWxXFc_Z3
	ZrJ34UGw40ga4UJasrtr4fX34UGa18JFn0vF1DXrs7Aas8Zw15Xr48Jw15Zr1Y9FWqqFs5
	ArWFqr95ArnxKosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1LvtUUUUU=

After some thinking, I think it is better to send this new version.

v2: Update the commit message of patch #2 to explain the compatibility
    problem.

Tiezhu Yang (2):
  LoongArch: Change 8 to 14 for LOONGARCH_MAX_{BRP,WRP}
  LoongArch: Extend the maximum number of watchpoints

 arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
 arch/loongarch/include/asm/loongarch.h     | 60 ++++++++++++++++++++++
 arch/loongarch/include/uapi/asm/ptrace.h   | 10 ++++
 arch/loongarch/kernel/hw_breakpoint.c      | 16 +++++-
 arch/loongarch/kernel/ptrace.c             |  6 +--
 5 files changed, 89 insertions(+), 7 deletions(-)

-- 
2.42.0

