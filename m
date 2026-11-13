Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548565;
	b=Dky1nncjOVwGj2mBaZYKIBN1M2Msyk+AxnwmxxsY9Nms4UIz0lQdRO8Gf0W+SbpjFY4f
	 zqK/rUoU8XtcPLOn1mpZ0XBlVuer4beCWHvmBHGGgibidxOjCCAI4BYxnmKdPqiialX90
	 bZ7r+JOHyXMMFiyU0JZ5e5ClRbxKBf2cVaXTHL+XgNZWXjv1Q9UdItUDUmL7YZDgEFLaE
	 /v8fHa0GEedlAqCX8DbRrGZThoJ45znt4eJwot2qL3YEsO3KRJajP9FdhrktnlwGugtGP
	 j5mHVydVwljuW1KBHNUl1AeH625GpJ9Ea10TzX7CL4I6bqxt+4X7YbCspcGWlxl3BKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548565;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=nnUXuWW5hZxQSWxtbT+KdWwHZUOfMi8FLyWjxSw9r7E=;
	b=RKJp+TGAcf8rnacXbWm57OM33wFsBQIKN30QztxzkT3alABQdpWyn0kL1oAIk+Dng9xX
	 sgVBIItMTIoZ9YTMOrT3f0F7FbvDgBLKyRxcMB/5zDWbn6iJwsJv2PZ3SS839Dbffs2g2
	 aztaMM1AmL8dz2T89gv6Fp1yxdNCZrz+VtEK0LJAaYQYkagj2Z60fyDykiEEnVSA/eaDO
	 tSPdI3wkMpQp/XOjzuCYGGoeahRAT5EwR8p7eqsyONcAz63Twb2BHE09LNwL3zf9QUsyh
	 35hKBY68/LsSZsP9QocE4IzOp9tRbo6pMTcyQG/yYJ42EJ+gLnL5OjBnPGa2yMs2RFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1532606A321
	for <loongarch@lists.linux.dev>; Fri, 13 Nov 2026 05:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1532606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8CxKvBLo_Zqvh4fAA--.23796S3;
	Fri, 13 Nov 2026 13:42:35 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAx3c5Ho_ZqLSg0AA--.40410S3;
	Fri, 13 Nov 2026 13:42:35 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-spi@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 1/7] spi: loongson: Fix incorrect SPI mode caching logic
Date: Fri, 13 Nov 2026 13:42:22 +0800
Message-ID: <ea450fff2ca4dc2200839daec1dbedd081fdd992.1794538736.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1794538736.git.zhoubinbin@loongson.cn>
References: <cover.1794538736.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c5Ho_ZqLSg0AA--.40410S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGr2b-sDSQAAsA
X-Coremail-Antispam: 1Uk129KBj93XoW7ur4UZrykuFyrtrW3Cw4rZwc_yoW8Jw1fpF
	W3A3W5Ww43J34xAFs3ZrZ8GF1Yv345Gr9rGa9Fyw409as0qw1UXw15WFyUurW3AFykXF1r
	XFW8urs5Gan5urbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

The current driver caches the SPI mode using bitwise OR:
    loongson_spi->mode |= spi->mode;

This is incorrect because once a mode bit (e.g., SPI_CPOL or SPI_CPHA)
is set, it can never be cleared. If a device switches its mode settings,
the cached state will not match the actual hardware configuration, causing
loongson_spi_update_state() to miscalculate when a reprogram is needed.

Fix this by directly assigning the new mode:
    loongson_spi->mode = spi->mode;

Fixes: 6c7a864007b6 ("spi: loongson: add bus driver for the loongson spi controller")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/spi/spi-loongson-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-loongson-core.c b/drivers/spi/spi-loongson-core.c
index 6ba7c56b1bdd..e95a9af94772 100644
--- a/drivers/spi/spi-loongson-core.c
+++ b/drivers/spi/spi-loongson-core.c
@@ -72,7 +72,7 @@ static void loongson_spi_set_mode(struct loongson_spi *loongson_spi,
 		val |= LOONGSON_SPI_SPCR_CPHA;
 
 	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, val);
-	loongson_spi->mode |= spi->mode;
+	loongson_spi->mode = spi->mode;
 }
 
 static int loongson_spi_update_state(struct loongson_spi *loongson_spi,
-- 
2.52.0

