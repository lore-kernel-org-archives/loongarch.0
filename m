Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548565;
	b=vtzjnNuwXAn1Mno85DVnksFotvBz0Z8etGaGnBekdqOe37TRDhhFz3KcSj+QeATDQ9GU
	 KmhHE8wYgfPAdPy2N0nQbAB9PqjwHD1fHeNyrInPldCud+Ryqpnp/38pxHrrZQRytdXyP
	 fIDVsDBm3zaU+68kNW/qHKZXq26i3exgRIH5+e11YJPJ1Yu1sfsidoH0wMytsf1xtg8ws
	 YPf1n74fS7tI0CgLEl2kTYO3BXQ89kgJ+/HJz77dWy38etzCRtVN2C+g6kuys87jNWm38
	 pIo7uW3OCtsGHfABszzuGHBt8YK0yP3sYxyNa+E4Ena+po3ipRA1MHqzsNvmm/IEi+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548565;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=HgvdQLtu0pVX82kUlJzFRUFKgu2TFtEGxVrXAnHR91U=;
	b=S+dcUOEjGrAjbCTmoxGfwDrBJV/eNdwPW3Dg8XTq+Adyi8AObkn+88CwiSP2SHUZVCfq
	 tVaTQEGO4JIgEdxXjAuFyLC23PawoSqPVl6ZtFxc+0X0iL+1Rho4bc5jSNGmPkpCaZ8iL
	 oWTwONv7LxqAtTMJCgMYdqWandx/RrlhHryoqZrn1lPfr3EJRgJ/PK76FWUoYGeEH0dKI
	 DB0aYfF6mPa6D5Xi7iuus/mxFH6sJDscIDJ422bqv9+qJ60+na7z1QiiEhNPJEMqrtjT0
	 IPHR4HmPKTxLycaSqAXoS0P/a+Q0DGq9E8SdcArNHGa1i+h7oCe+fzjlbdHaOjHRRtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B160A606A32A
	for <loongarch@lists.linux.dev>; Fri, 13 Nov 2026 05:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B160A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8CxutFLo_ZquB4fAA--.24043S3;
	Fri, 13 Nov 2026 13:42:36 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAx3c5Ho_ZqLSg0AA--.40410S2;
	Fri, 13 Nov 2026 13:42:32 +0800 (CST)
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
Subject: [PATCH v2 0/7] spi: loongson: Fixes, cleanup and IRQ support
Date: Fri, 13 Nov 2026 13:42:21 +0800
Message-ID: <cover.1794538736.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
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
X-CM-TRANSID:qMiowJAx3c5Ho_ZqLSg0AA--.40410S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGr2b-sDSAAAsB
X-Coremail-Antispam: 1Uk129KBj93XoWxXFyrXFy5AFWxZF4xJw45XFc_yoW5GFWkpa
	9xW39Ykw4DKrWIyFsayayjvFyrC395KFW5JFWxtws8Z3y5Gr12qFWDtayYya9rCFyfCa4j
	qr18Ka1kuF4rCFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxxhLUUUUU

Hi all:

This series fixes several long-standing bugs in the Loongson SPI
controller driver, cleans up register access, and adds interrupt-driven
transfers with a polling fallback.

Grouped as follows:

  Bug fixes (suitable for stable):
    1. Fix SPI mode caching so mode bits can be cleared.
    2. Drop the redundant and wrong CS deassert in setup(); the SPI core
       already drives the idle CS after ->setup().
    3. Separate PM register state from runtime state so set_clk() cannot
       corrupt the saved suspend state.
    4. Fix clock retrieval on ACPI platforms: try clk, fall back to
       "clock-frequency", fail probe if neither is valid, manage the
       clock over suspend/resume.
    5. Fix the clock divider calculation with an explicit table, avoid
       the off-by-one/out-of-bounds issue, propagate errors, and expose
       min/max speed to the SPI core.

  Cleanup:
    6. Use bitfield helpers and set/clear/update_bits() for register
       access. No functional change intended.

  New feature:
    7. Add interrupt mode support.

On a Loongson-2K3000 board, SPI flash reads improved from about 60 kB/s
in polling mode to about 950 kB/s with IRQ mode.

Thanks.
Binbin

===========
V2:
- Patch count reduced from 8 to 7;
- Deferred the private-definition move and regmap conversion from v1;
  instead, register access is cleaned up with bitfield helpers.
- Reworked the CS fix to drop the redundant and wrong deassert in
  setup(), since the SPI core drives the idle CS after ->setup().
- Reordered the clock fixes so the ACPI/clk-rate fix comes before the
  divider fix.
- Reworked IRQ support: fifo-depth/icnt handling, spinlock-protected
  transfer state, handle_err() cleanup, bounded message splitting, PCI
  IRQ vector allocation, platform optional IRQ with -EPROBE_DEFER, and
  polling fallback.

Link to V1:
https://lore.kernel.org/all/cover.1793689461.git.zhoubinbin@loongson.cn/

Binbin Zhou (7):
  spi: loongson: Fix incorrect SPI mode caching logic
  spi: loongson: Drop redundant CS deassert in setup()
  spi: loongson: Make suspend/resume registers PM-specific
  spi: loongson: Fix clock rate retrieval on ACPI platforms
  spi: loongson: Fix clock divider calculation with explicit table
  spi: loongson: Use bitfield helpers for register access
  spi: loongson: Add interrupt mode support

 drivers/spi/spi-loongson-core.c | 519 ++++++++++++++++++++++++++------
 drivers/spi/spi-loongson-pci.c  |  28 +-
 drivers/spi/spi-loongson-plat.c |  17 +-
 drivers/spi/spi-loongson.h      | 129 ++++++--
 4 files changed, 550 insertions(+), 143 deletions(-)


base-commit: c0ccde965b4874afea9bd40f8cc2362ab9910711
-- 
2.52.0

