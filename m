Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF0C23098A
	for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859651; cv=none; b=Xi8rDdJf6X9iraKdWQXbmsizTET0+BlERlFahztweyEMvIWOP1C10KYimYFFI/aZ6J6vN75etwWQ5WqxsmXrQh92rloxHruEisrhVVsA3MpQw58NnCs0sz3S1z7Itc+0U0UgY7CJ6nnYr17UoR9WwPYU9M3Ok9zbGBR9gyx1QxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859651; c=relaxed/simple;
	bh=yMrXbRHBuHLDzGbkQ+aBJGEDRUkKX70cPVF8pNqzhWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1nAHtALA0PgiLb2h1CD4WEZGq7gTlFmJ81CNe1CNGd8Tl+9V18ChkUqQDeoteT5f05+DQSW0Wq2kYyH/iHNkPFIcc0bZ1OLnX6EDoQvG8T5jvLXr8l6lHe95CO8FEBA2hjj54WBoxgOSIbgz9gexb0kM1HbrgkApRR4A6vOKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8Ax6+H8X4ZnEDdjAA--.62881S3;
	Tue, 14 Jan 2025 21:00:44 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAx7+X6X4ZnhBwiAA--.3371S2;
	Tue, 14 Jan 2025 21:00:43 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-clk@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 0/2] clk: clk-loongson2: Fix two small issues
Date: Tue, 14 Jan 2025 21:00:27 +0800
Message-ID: <cover.1736856470.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx7+X6X4ZnhBwiAA--.3371S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruF18uw18urWxKr1rGFW7GFX_yoWfWFb_ua
	4xtF1xGr4kJr43G3WjgFn29ryS9rWqvw1rC3W7trW2q34ftrn8trZ7Gry3uFn3uF48Canx
	Way8Crn3Z3s3uosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU24SoDUUUU

V3:
patch(2/2):
- Correct the array of pointers address;
- Collect both patches together.

Link to V2:
https://lore.kernel.org/all/20250109113004.2473331-1-zhoubinbin@loongson.cn
https://lore.kernel.org/all/20241225060600.3094154-2-zhoubinbin@loongson.cn

V2:
patch(2/2):
- Add Gustavo A. R. Silva to cc list;
- Populate the onecell data with -ENOENT error pointers to avoid
  returning NULL, for it is a valid clock.

Link to V1:
https://lore.kernel.org/all/20241225060600.3094154-1-zhoubinbin@loongson.cn/

Binbin Zhou (2):
  clk: clk-loongson2: Switch to use
    devm_clk_hw_register_fixed_rate_parent_data()
  clk: clk-loongson2: Fix the number count of clk provider

 drivers/clk/clk-loongson2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)


base-commit: 590a094e7bd2e5a10c392f13cd86489e1eb3ac86
-- 
2.43.5

