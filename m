Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FB4146D69
	for <loongarch@lists.linux.dev>; Thu,  9 May 2024 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715235513; cv=none; b=N6kGfjgoXEe6KTNwTPQw+uNGbJnOR1HdX5J092GSj7i/d+9vLsCUWCSBr8FTuMxkUNYKeZDGls5xjJVj/hVTOfg4RaSMeN30fWBHhr+ljnS1TExiVQqeNcDC3Nb19qIvm6qnjKDEcnx+4BIUP7gSY9Hgi6wnJSRD9aaC2kudgU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715235513; c=relaxed/simple;
	bh=Wc3keCQKKvf7gPclFIQIJ/Qgzx6dXq1JeC9F3nNsYZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZa9YQeIAZsEXe2yHssHfKwykkIa/otuuxjSbY7j11mYfhuiEzZnbBvYsWwLHGcHpr7DL2P0JJMEgrObCzJwTmGphAzsr02G6VQ7G6FMTg7b+OFjG7I9I9/Vds6YMcuooCie/P3zdK3htyccFlgc4l8hEXqr8p6A/hIoE0phPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8Dxk+quajxmoNUJAA--.13510S3;
	Thu, 09 May 2024 14:18:23 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxT1WqajxmycoWAA--.26766S2;
	Thu, 09 May 2024 14:18:19 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/3] LoongArch: dts: Add more support device ndoes to Loongson-2K
Date: Thu,  9 May 2024 14:18:03 +0800
Message-ID: <cover.1715222938.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxT1WqajxmycoWAA--.26766S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XryDCr4UWry8Kw4rGr1kCrX_yoWkGwcEgF
	yfWFykGw18WFykJayqqryrJ39Ivr4j9a1Ykas2qa4fKa43tr13XF4kua9xZF15urW2qrs8
	JrW8Ga18Cr1agosvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8nmRUUUUUU==

Hi all:

Now, more Loongson-2K related deviers are supported, this patchset add
these device nodes to dts files.

Additionally, we remove the "disable" state of the ls2k1000 clk node as
it was unnecessary.

Thanks.

-------
V2:
patch(1/3):
 - New patch. Follow Conor's comment, remove the "disable" state of the
   ls2k1000 clk node as it was unnecessary.
patch(2/3)(3/3):
 - Remove the "disable" state of the clk node as it was unnecessary;
 - Add cpu-alert trips.

Link to V1:
https://lore.kernel.org/all/cover.1715156107.git.zhoubinbin@loongson.cn/

Binbin Zhou (3):
  LoongArch: dts: Remove "disabled" state of clock controller node
  LoongArch: dts: Add new supported device nodes to Loongson-2K0500
  LoongArch: dts: Add new supported device nodes to Loongson-2K2000

 arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 85 ++++++++++++++++++-
 .../boot/dts/loongson-2k1000-ref.dts          |  4 -
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  |  1 -
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 48 ++++++++++-
 4 files changed, 126 insertions(+), 12 deletions(-)

-- 
2.43.0

