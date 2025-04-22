Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7577F28135B
	for <loongarch@lists.linux.dev>; Tue, 22 Apr 2025 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325118; cv=none; b=AY+XKXpoEoR2cSMyD2rW+edUhuEWgosywh57vhvx5/x+0HBNKJEPJwqanUDrcD9E+9uoGgrojTju8tw8PUbvg3bVsqVMyqT1Y6t3MmhHi7qLl2rffHwn9i0SlFzQBGFtV+VOaEIgtsTJZ4YZN504Ixiff19o2pP/pgj+IO5KGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325118; c=relaxed/simple;
	bh=G7N9BlSbjxU6RkgC/LrGflA+iagbr9xcCrUjlVebh+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLMzYvywHLTs7vvF5kAQUmSx+e6VBzgSwbY+I5TY/+RnPQ3ZpzZAXPGJKlOp6wl3VK27ZVGc8tuys5+OJoqdvDQ523HznwGFsowCmwkph1XnKqjV4jG6WvU7lwVn+2X+VLOeQZ2mZHWrCDCKDFmWa/U/OwjfEjMXwEnrPseMktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8AxaeA4jAdoyQbEAA--.63918S3;
	Tue, 22 Apr 2025 20:31:52 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMAxTRszjAdoEPePAA--.4685S2;
	Tue, 22 Apr 2025 20:31:51 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jan Stancek <jstancek@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 6.1&6.6 V4 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
Date: Tue, 22 Apr 2025 20:31:32 +0800
Message-ID: <20250422123135.1784083-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxTRszjAdoEPePAA--.4685S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFWDAF48AF4xtw18AFy5trc_yoW5Ww4Dpa
	43Cry3K348XrnrWwnxtw4rWr13ZrWkGw18ZrsrGw4rGa1DAFy0vr1jvF4Fka4xJryrtr1a
	qa42qas0gr1rAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Backport this series to 6.1&6.6 because we get build errors with GCC14
and OpenSSL3 (or later):

certs/extract-cert.c: In function 'main':
certs/extract-cert.c:124:17: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
  124 |                 ENGINE_load_builtin_engines();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
certs/extract-cert.c:126:21: error: implicit declaration of function 'ENGINE_by_id' [-Wimplicit-function-declaration]
  126 |                 e = ENGINE_by_id("pkcs11");
      |                     ^~~~~~~~~~~~
certs/extract-cert.c:126:19: error: assignment to 'ENGINE *' {aka 'struct engine_st *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
  126 |                 e = ENGINE_by_id("pkcs11");
      |                   ^
certs/extract-cert.c:128:21: error: implicit declaration of function 'ENGINE_init' [-Wimplicit-function-declaration]
  128 |                 if (ENGINE_init(e))
      |                     ^~~~~~~~~~~
certs/extract-cert.c:133:30: error: implicit declaration of function 'ENGINE_ctrl_cmd_string' [-Wimplicit-function-declaration]
  133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
      |                              ^~~~~~~~~~~~~~~~~~~~~~
certs/extract-cert.c:64:32: note: in definition of macro 'ERR'
   64 |                 bool __cond = (cond);                   \
      |                                ^~~~
certs/extract-cert.c:134:17: error: implicit declaration of function 'ENGINE_ctrl_cmd' [-Wimplicit-function-declaration]
  134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
      |                 ^~~~~~~~~~~~~~~

In theory 5.4&5.10&5.15 also need this, but they need more efforts because
file paths are different.

The ENGINE interface has its limitations and it has been superseded
by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
Some distros have started removing it from header files.

Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major >= 3.

Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pkcs11-0.4.12-4
and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and comparing that
the result is identical.

V1 -> V2:
Add upstream commit id.

V2 -> V3:
Add correct version id.

V3 -> V4:
Use --patience to generate patches.

Jan Stancek (3):
  sign-file,extract-cert: move common SSL helper functions to a header
  sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
  sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3

Signed-off-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 MAINTAINERS          |   1 +
 certs/Makefile       |   2 +-
 certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
 scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
 scripts/ssl-common.h |  32 ++++++++++
 5 files changed, 178 insertions(+), 129 deletions(-)
 create mode 100644 scripts/ssl-common.h
---
2.27.0

