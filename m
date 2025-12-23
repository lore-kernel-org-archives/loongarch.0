Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94902F1FF4
	for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472158; cv=none; b=QDivojWAe2k2YN6AoqEjcLZDnhrd62GegPDKi3IUiOfm8HpE/41g/p9jO4SWY61ajEecfRrBNq1n3LtVSQaP9y1s1T/qeGzgXyyolxmA8l+swZOXukMUFZ1OTNmwn/lRxKR+8Lp9QYShftEYtXuK1Ve7aBVO2xt9vreMTJtIwf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472158; c=relaxed/simple;
	bh=72kFgbojzsG+yQ7XBwSHrErdHyU8qVtF5gQW7+ojMCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1fFa1Yci16RHwgGzX9mCWuB9K4yoZ9WtIEtCtdJKaS/Zv56IYhI5dzHJPy6+O3lluPGDXy0WdK/LaHEXj6cC6JLK5uIgP/vY8MvlKt0dWDcd5OgTst9caTCU1QZVorFwO05dLsCu1d+AmvU4p6kUD/5LBT+W7TEvjFin9jaU90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8BxXcPSOUppE0wCAA--.7405S3;
	Tue, 23 Dec 2025 14:42:26 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJBxLMLQOUppTr0DAA--.8929S2;
	Tue, 23 Dec 2025 14:42:25 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 0/2] RTC: Add Loongson-2K0300 support
Date: Tue, 23 Dec 2025 14:42:11 +0800
Message-ID: <cover.1766471839.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxLMLQOUppTr0DAA--.8929S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEECGlI3ZkFGQADs1
X-Coremail-Antispam: 1Uk129KBj9xXoW5tw15KFW8AF43tr48KFW3urX_yoWxGrXE9a
	4Ivas7Jwn8ZFn7Ja47Xr1xu34fZrW29w10k3WDtwnYv34jyry5tF9rArZxG3WfWFW3Zr95
	Xa1xGFy8Ar1SgosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU24SoDUUUU

Hi all:

This patch set introduces the Loongson-2K0300 RTC, which has a similar
hardware design to the Loongson-1B, but without the alarm feature.

To Keguang:
Would you have time to test the driver on a Loongson-1?

Thanks.
Binbin

Binbin Zhou (2):
  dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
  rtc: loongson: Add Loongson-2K0300 support

 .../devicetree/bindings/rtc/loongson,rtc.yaml | 13 ++++
 drivers/rtc/rtc-loongson.c                    | 65 +++++++++++++------
 2 files changed, 57 insertions(+), 21 deletions(-)


base-commit: 16bd954c93360145bc77cc601e350913fc28182d
-- 
2.47.3

