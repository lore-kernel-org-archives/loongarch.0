Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D014B946
	for <loongarch@lists.linux.dev>; Mon, 11 Nov 2024 05:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731302977; cv=none; b=FWDtbBRdKDShlcxdtSyUnFvh/sO10dL2GFkntqH6g1kU+YXpQqIOS78ZwYcIkBFCpyXPI1ZoCSOVVV88By2qpmBDphqqFxtv5kw2xTptpHjeBei0DjVmdk0DTL7qP+S2bQbaZSC4A2uSXNGDgSegDx5/stP4jV4JJe7tAVwb91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731302977; c=relaxed/simple;
	bh=1H0lsA1melbP7Mkd+oLrxFN3y7nwa8EVtGO8EFXhi/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1RDJbY+BPdWGl1o0/IlV+m/+mCoMuOmn0Tu0tW8h648BWtge50p/cCjQgEHx6A1srcCQGaGfFrNO2u3d1a1dQzpBcOCWX/meAnSls1dT0WC6nmCWd51djJuyMA7FIuDr8Gji9kB4YIofGgt7VIJ/c3BFhgQLOrLeLHM7eRDAtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uzqfr+Hl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d3JIuFLw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uzqfr+Hl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d3JIuFLw"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731302967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifoGJMBHZ1DqZx2Obrxr/X5prXUNx0tqWRzJjSaO6kQ=;
	b=uzqfr+HlV4tT1qhLmCHVKuDJwDUkgECQzV0KEwbpKjqOL5hQSRsODdzI77K1XP+vlvRBjd
	XIsyuBW2tsdl96XDDkG8rP2AcjZ4dR5hYUz/gJlD4koPvds4PYRYxTzbFqAo7+ryVS7F0L
	SwFp3k/wk7efTCrgialIo+06i5LdrQTSf+uJfYWnzC+JhcSgZOI6ZTVTzGUAe0Xw/qlJxl
	m5bmWTY5LSU3nI2mwmoVl0xDOqExZ3ppspE39bMUkWppxYsNLfgnmhWgseX33I0iKfpUUX
	FwV4iV1jrq9VTwiTOSPbt0CrJDOxxRVva57ZdSREPPOM5ChKAk+gt481OQrMWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731302967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifoGJMBHZ1DqZx2Obrxr/X5prXUNx0tqWRzJjSaO6kQ=;
	b=d3JIuFLw53tTVosNz6RG79DYTdEndoP8rAy6VJUQOY6vHEBypbCWAx3MDFlr0KN2PTet2r
	3ZgP7LuWVEvPPxBA==
Date: Mon, 11 Nov 2024 06:29:18 +0100
Subject: [PATCH v2 1/3] kunit: qemu_configs: Add LoongArch config
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241111-kunit-loongarch-v2-1-7676eb5f2da3@linutronix.de>
References: <20241111-kunit-loongarch-v2-0-7676eb5f2da3@linutronix.de>
In-Reply-To: <20241111-kunit-loongarch-v2-0-7676eb5f2da3@linutronix.de>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731302965; l=1247;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1H0lsA1melbP7Mkd+oLrxFN3y7nwa8EVtGO8EFXhi/A=;
 b=5qrvr/riA2uB3GHVeHZnLAJB3A6LUapyCXEA+OrrgBheolSZfBFWT/g2Mu2BhB781zEK5t2S8
 LcmfxtQkNXXCdUDk91TIbTFmOfz8zKZqRjdiwveLekIdux27rmgh5UU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Add a basic config to run kunit tests on LoongArch.
This requires QEMU 9.1.0 or later for the necessary direct kernel boot
support.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by: David Gow <davidgow@google.com>
---
 tools/testing/kunit/qemu_configs/loongarch.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/kunit/qemu_configs/loongarch.py b/tools/testing/kunit/qemu_configs/loongarch.py
new file mode 100644
index 0000000000000000000000000000000000000000..a874a2156e0f791caaaf30e5f7b17fc175bb55ee
--- /dev/null
+++ b/tools/testing/kunit/qemu_configs/loongarch.py
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+from ..qemu_config import QemuArchParams
+
+QEMU_ARCH = QemuArchParams(linux_arch='loongarch',
+			   kconfig='''
+CONFIG_EFI_STUB=n
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+''',
+			   qemu_arch='loongarch64',
+			   kernel_path='arch/loongarch/boot/vmlinux.elf',
+			   kernel_command_line='console=ttyS0',
+			   extra_qemu_params=[
+					   '-machine', 'virt',
+					   '-cpu', 'max',])

-- 
2.47.0

