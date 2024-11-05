Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69D11D54E1
	for <loongarch@lists.linux.dev>; Tue,  5 Nov 2024 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810355; cv=none; b=elI5kEzAIfZZI36hd6M0UAcCJ46Nrz7KBO1G2h0K15x73PjcUM9qTN5a6+jrzb6PXtKZBNQSnhU22v4p4DBSGU29JOotf8xQcBRnWm++RH2C55n1VLG6w1L9Xkfk0bpVpDCqqTUjSQfAd1vwrT88DiLlG1W3pQjHfsxr6hu+sdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810355; c=relaxed/simple;
	bh=sFqNT7sUzHWlwQ8/M8ZP+Q2MBkvEtN117vvn79XMsXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kNni/fcBb9o1NH864ZgkZbfnH0P67icmL3PG/BD6F3Bi4LkU+G3ggW6rKgsQyYXHvHryTnilS+kdo8FmM9EMcv28wUF5ikhwymhJTQM0t+OKi9F5+3yiHjIOUv9oeq1AaOTSTvLOOubneO06Ay4+n72fgfKkXbMNMaFGjLNnTLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxDePtESpnfbUxAA--.33282S3;
	Tue, 05 Nov 2024 20:39:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxrsLsESpnw4lCAA--.26454S2;
	Tue, 05 Nov 2024 20:39:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add jump table support for objtool on LoongArch
Date: Tue,  5 Nov 2024 20:39:01 +0800
Message-ID: <20241105123906.26072-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxrsLsESpnw4lCAA--.26454S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xw1fWF18ZFyfXr4rJr1rXwc_yoWDXFb_W3
	4xW3s5Gw45WayDta45trnY9ryjkF48Xr4fAFWqvr47Gry5Jrn8GFsF9a4UZr1DKFW5uFs8
	JrZ2qF1xCr429osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

This series is based on 6.12-rc6, tested with the upstream mainline
binutils, GCC and Clang, all the changes are under tools/objtool and
arch/loongarch.

It is time to remove the compiler option -fno-jump-tables to enable
jump table for objtool if the compiler is GCC and it has the compiler
option -mannotate-tablejump, the next work is to add the corresponding
support with Clang after addressing some corner issues due to different
compiler behaviors.

Tiezhu Yang (5):
  objtool: Handle various symbol types for rodata
  objtool: Handle special cases of discard.reachable
  objtool/LoongArch: Add support for switch table
  objtool/LoongArch: Add support for goto table
  LoongArch: Enable jump table with GCC for objtool

 arch/loongarch/Kconfig                 |  3 +
 arch/loongarch/Makefile                |  9 +++
 tools/objtool/arch/loongarch/special.c | 83 +++++++++++++++++++++++++-
 tools/objtool/check.c                  | 38 ++++++++++--
 4 files changed, 128 insertions(+), 5 deletions(-)

-- 
2.42.0

