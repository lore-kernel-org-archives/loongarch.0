Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287C947F2E8
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537278; cv=none; b=Y5hnxy1nQgPzUjirQCCpn2lA3M3fwAWeKXHTAVGSV9AFcUTX8QabpJY2sjQUs7nZpOASF1f7nEgyuOTqCBBHLpHjKnadcSOhDZBEosYh40kBIznjl4Uf0Q11/ygtBp34y07dGFshNoocQk6aghik5Zq0Vg80uD5sAn+2Bgyrv68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537278; c=relaxed/simple;
	bh=YYqNS47CMB7zHzwowQB0fwLPm/rMYM2NTr/srbIr6No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUtUvvja2IyEn8V50EZk3oj/LAteQ30MQyvfSwNf9xLEdI+g0ow6DIQohswLSEc3yIlARWjOHQ1An0BEbj9wxuD8JYw4PnHI8nE60ZHVRoBdPZDuBjvd9ZKGOsKLEP8pt9ieeppR/DqDIsnoucTvBW6DEFrSNmrtFRfReT45zoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Axw8C1xaZpQQEXAA--.10075S3;
	Tue, 03 Mar 2026 19:27:49 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJAxHMKzxaZpM59NAA--.14456S2;
	Tue, 03 Mar 2026 19:27:49 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/3] mmc: Add Loongson-2K0300 SD/SDIO/eMMC controller support
Date: Tue,  3 Mar 2026 19:27:37 +0800
Message-ID: <cover.1772529875.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxHMKzxaZpM59NAA--.14456S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEPCGmmeCEI-QAAsn
X-Coremail-Antispam: 1Uk129KBj9xXoW7JrykXF1rtw43uw1xXF4xAFc_yoW3ZFbE93
	4SvFykGws5WF9xXa40vr42qryfZrWvva4IkFy8tw1a93yYyr15XF9rurZ8WFySqF45Wrnx
	XrWrC34Fy34xWosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

Hi all:

The patchset describes two MMC controllers of the Loongson-2K0300 SoC,
one providing an eMMC interface and the other exporting an SD/SDIO
interface.

Its hardware design is similar to that of the Loongson-2K2000, but it
suffers from hardware defects such as missing CMD48 interrupts.

Thanks.
Binbin

Binbin Zhou (3):
  dt-bindings: mmc: loongson,ls2k0500-mmc: Add compatible for
    Loongson-2K0300
  mmc: loongson2: Gathering all SoCs private data together
  mmc: loongson2: Add Loongson-2K0300 SD/SDIO/eMMC controller driver

 .../bindings/mmc/loongson,ls2k0500-mmc.yaml   |  1 +
 drivers/mmc/host/loongson2-mmc.c              | 59 ++++++++++++++-----
 2 files changed, 44 insertions(+), 16 deletions(-)


base-commit: 6a4a4c1cc0012590b8bebf6c95d51687d39b420c
-- 
2.52.0

