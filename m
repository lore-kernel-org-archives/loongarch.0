Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DA61A2860
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551090; cv=none; b=Z9r0st5dtt0SaRiYxIR2Of29qRCTowQkEiNF4cKICBceCiWnTjWjqPSUhOkSSNxnBpD9BNs76k1gIxDalU2keywcspeahqOX+Gz6Az31/SqyN4FNmbVWZecgQ0Ixy95Pw+MItfHlXnFXDKzzigOzoxPiOpUw67gSqoV+MPNqi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551090; c=relaxed/simple;
	bh=zdoRleN++NavKeZJPhkjZNXuS6ExdXpojeIj9P4dNwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DVzXJIIlR3a8oV7yB1MKRqUgX1WBxjVNjJrBXnuYtFrLbQxeAjLJLv4OSkb6FNPP4espZaIQ0oxizDJztLyhtcSHzDKPdIzURFYJcqg/+pAo2tkyCOWWfCkH2CphUXH4+8g4Ki5eD87zZOmQFyQgm+A7VUR8Ih2H8Ckv6UqK+rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8DxGeFoaHJnEc9bAA--.49684S3;
	Mon, 30 Dec 2024 17:31:20 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMCxncVkaHJnp74NAA--.4295S2;
	Mon, 30 Dec 2024 17:31:17 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	dri-devel@lists.freedesktop.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 0/4] LoongArch: Add Loongson-2K0500 BMC support
Date: Mon, 30 Dec 2024 17:31:07 +0800
Message-ID: <cover.1735550269.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxncVkaHJnp74NAA--.4295S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryxJw4rGw17GrykZw1UArc_yoW8Zr45pa
	1YkF95Cr4DJF47KrWfX3W8urW3uasYqa48Kr17tw15WrWYya40y345tFy5Z3s7AF13Jryx
	trn8Cw17WFyDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Gii3UUUUU==

Hi all:

This patch set introduces the Loongson-2K0500 BMC.

It is a PCIe device present on servers similar to the Loongson-3C6000.
And it is a multifunctional device (MFD), such as display as a sub-function
of it.

For IPMI, according to the existing design, we use software simulation to
implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.

Also since both host side and BMC side read and write kcs status, we use
fifo pointer to ensure data consistency.

For the display, based on simpledrm, the resolution is read from a fixed
position in the BMC since the hardware does not support auto-detection
of the resolution. Of course, we will try to support multiple
resolutions later, through a vbios-like approach.

Especially, for the BMC reset function, since the display will be
disconnected when BMC reset, we made a special treatment of re-push.

Based on this, I will present it in four patches:
patch-1: BMC device PCI resource allocation.
patch-2: IPMI implementation
patch-3: display, based on simpledrm
patch-4: BMC reboot support

Thanks.

Binbin Zhou (4):
  mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core driver
  ipmi: Add Loongson-2K BMC support
  drm/ls2kbmc: Add support for Loongson-2K BMC display
  drm/ls2kbmc: Add Loongson-2K BMC reset function support

 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmi_si.h      |   8 +
 drivers/char/ipmi/ipmi_si_intf.c |   3 +
 drivers/char/ipmi/ipmi_si_ls2k.c | 250 +++++++++
 drivers/gpu/drm/tiny/Kconfig     |  18 +
 drivers/gpu/drm/tiny/Makefile    |   1 +
 drivers/gpu/drm/tiny/ls2kbmc.c   | 918 +++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig              |  15 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/ls2kbmc-mfd.c        | 145 +++++
 10 files changed, 1361 insertions(+)
 create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
 create mode 100644 drivers/gpu/drm/tiny/ls2kbmc.c
 create mode 100644 drivers/mfd/ls2kbmc-mfd.c

-- 
2.43.5

