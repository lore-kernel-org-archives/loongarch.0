Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0BC2F1FF9
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893213; cv=none; b=WYMrHRdspsZP+ungcWQrQf9xFPEvEszjz9HLt9HRNbrSl++tVVv3HGi88Z5s24dc54dRHCRlDUlbt+6TzyJHXZ4UxBSch20qk32mFmjy4xET+GaBTunH5tPpiVwz6lMvTDlJJ9aASL9NWAg5hZXnkknQ5A4ljJTJ3PKsyFooml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893213; c=relaxed/simple;
	bh=7CqAyLaRpoFNFJyBFc4IvMz44ll4GWsT4oEnDgIbvz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DWBfNKKjlYwXO1hOvPz6AehYaJhfUsAjRBrH0aHaeJZFx1LJn1QE+zNONhxU0tW80/mRoeYgAjnZCkRfmnfcByoRdLR+LI25ChXbKB0ZsAer/buV8Jsv336eqFWytaoG9sizj0598P1kGdDIWUMiW+YbNfR4gQj9FTvm+eMX9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9MPELho5y0GAA--.12745S3;
	Wed, 03 Sep 2025 17:53:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxfcEMELhom_16AA--.5842S2;
	Wed, 03 Sep 2025 17:53:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	rust-for-linux@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] Fix objtool warnings with RUST on LoongArch
Date: Wed,  3 Sep 2025 17:53:12 +0800
Message-ID: <20250903095315.15057-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxfcEMELhom_16AA--.5842S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur47AFWrJF1xGrWxZr17XFc_yoWxuFb_CF
	W0v34kGa48ZFWrAF9ayF95trykGayvgr1YkF1qqr47Gry3JrZ8GF4DWa4FvF12grW3WrZx
	JrZaqFyfCrsFkosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==

This series is to fix objtool warnings when compiling with LLVM and
CONFIG_RUST is set, thanks WANG Rui very much for his suggestions
about RUST.

The patch #3 uses the option -Zno-jump-tables, here is a related
discussion:

https://github.com/rust-lang/rust/pull/145974#issuecomment-3236418282

Tiezhu Yang (3):
  docs: rust: quick-start: Add another way to install
  LoongArch: Make LTO case independent in Makefile
  LoongArch: Handle table jump option for RUST

 Documentation/rust/quick-start.rst | 14 ++++++++++++++
 arch/loongarch/Kconfig             |  4 ++++
 arch/loongarch/Makefile            | 16 +++++++++++-----
 3 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.42.0

