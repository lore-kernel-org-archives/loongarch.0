Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B00A3A1A2D
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446034; cv=none; b=j+rOC8wwLUIuZIDAHtXQ1gXHLK7rBZL9QMSKpVLMyFYWEpoC2vv4BLYuu7zZGfUVSiJNkumqckq2KhIQ+zNKNfINyzDPX96qNLWihaINHttrsJfvNAq1xdVY99HPVNqrr9sUcx6mthszrPoCy8blV7UAi+JAN++vc/idYPNxc18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446034; c=relaxed/simple;
	bh=GlzyRXhW7BOFU2J58m5FlsVsMQJSPP8T+AYIfqJL/UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csit3E6IY94fcUKbPbIBd9iJhi3dL6NegufpB1VtGHt0STLHtA0dq/LKC8wwUytqEgMsGi1YwdW2wWqNjNjkkPtDvNY8az70M6HODOrLjAMufPlYcYo5jdrsRVr2g/kU6JEi3NGg7IqTjMuImbnLnzApsiPV2seaLC/6CFEAb3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEa7xhhY; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEa7xhhY"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so5699512b3a.0
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446033; x=1778050833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=NEa7xhhYx0emo6VZO02QU6pXZlPVO4OhWhwWaob4H1UxaiCvM8/wrXKe5hQUsdG5t0
         zNqg8sSq+PYz6+eUXJHOb8TErChdII/0svVTjm+iYyToFGZBA/ATyrpEmm3DRBc66pLP
         ASnUmmud94+fzzS1zaKoBs9MxmXRZbe5IGWW5ksR6i0dQpx3OoXabeX7U+S84YQtIMWd
         3bYCfOrY/DGwtCVWk+bdO4+ko7ewCDvFKc68bvphMjMO7t+GSCXncgDQSZlPLccQiEWz
         0poNryWhJDARpJ7QNgfKVJnxSbPLbshzDFTl4Z+HDQ4kJfhi1S3JODQkjOypHLdmcBjd
         1pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446033; x=1778050833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=WhauacHxHc6LiD1+t/mjYYp3ToIgdfSDf0RhB4iMofxqupCJEYZD2iB1OBOZNfZLR6
         z/+DVcrqXQbYM/afNvC6jzTAJf9jU88qDz+rUOOZsssID7ow6SfJwK8cWQmQvEJhXWDn
         98IB55zClwHFYzY9cCIy4AGgAimjOCQv4Ru/KUlJD/PRdquVcPR58XIBM4pF2xlr826L
         aycJ02kCm2iDGgdsID7zJOMhySa8S6HRwsk/Q29y1BDHvsfnPZUCAf4t8B3RMHKRabER
         GjjHvl1B2MhNyUbtLRsw0CGKS1FxHDgm8LOV/JAqWt/1dLN0nPXeoC7IWyjBpA9D2qdV
         RF/w==
X-Forwarded-Encrypted: i=1; AFNElJ8mzN769H+GC6MKaKWrFkBxXGrVe37hm8u4F4PdHxjZiKuR6UBVuZPkbT5+xSOFdYCZwd0RzSs2ReE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5PGh1j4JlItX4fjvsj51a20/N5jXqWKCNXmrh/blUXz1NjXG3
	ftNia1wbEHGM/IVQEWKAUREF7a7V+DP2aK4bwBKmDKdVkus15o6fyZV6
X-Gm-Gg: AeBDievoWsNji29HzDQ+3jV50rhFt//XrvPSY9QrMvMsPXK8AuLyPuTViIvt1HzZaiL
	MsJ6HuNXyS8j/sNe93pEbJy58bASyBtSzMfZdSLXMxomz7cBSTPAb9Y1Go5hbteP8h4mZctTTjC
	8+EWD+3qEXzsiybNBW8Rt/lIB1O6i6LjKJ2jvYkCMJqYUrvpmEvPWnJWaVj78zPZliwfEApG6q6
	21Zfd7mJh3JyErsvl6lezmMV7NeTYZxNoRIA0K8nD49nFAGloxp24OYuAaM1iahIgeTagOuZ+Db
	geEdtwrHfzHDry+KOb1rRtlc7YZhDCHpXyjIeAOvoSOMOcjdRNJjLZOqDi1DXx38r/pvESIRKaX
	oD2JpdkzO+hWRlzjoKwwhSAmCdjNXNO1HedjNOHkXEhfqWSlDiieC+N9mA1uaAhBAyEdmvy+vVf
	nvZ9PN8gn42PcXPcyuFSfIh6ha4Z3ks1bNIlbP3H6LqoOksQYQ
X-Received: by 2002:a05:6a00:a14:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-834ddc14f4emr6920159b3a.24.1777446032715;
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 11/11] Documentation: admin-guide: kdump: document linux,no-dump DT property
Date: Wed, 29 Apr 2026 14:58:31 +0800
Message-ID: <20260429065831.1510858-12-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the new 'linux,no-dump' reserved-memory device tree property
and the automatic exclusion of /memreserve/ entries from the kdump
vmcore.

The section covers:

 - The two mechanisms that exclude reserved memory from the vmcore
   (firmware /memreserve/ entries and linux,no-dump child nodes).
 - Intended use cases (firmware-owned GPU, DSP and modem carveouts).
 - Interaction with the existing 'no-map' and 'reusable' flags, with
   the silent-ignore precedence implemented by the kernel.
 - Architectures honouring the hint (arm64, riscv, loongarch).
 - An illustrative reserved-memory DTS snippet.

The DT binding for the property itself is maintained in dt-schema.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..c2246888e84d 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -600,6 +600,65 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+Excluding reserved memory regions from the vmcore (device tree)
+===============================================================
+
+On architectures that boot from a device tree and use kexec_file for
+kdump (arm64, riscv, loongarch), specific reserved memory regions can
+be excluded from the ELF PT_LOAD segments of the crash dump.
+
+Two mechanisms contribute to the exclusion:
+
+1) /memreserve/ entries from the FDT header.
+
+   These are firmware-level memory reservations with no associated
+   device tree node and therefore no driver-level description. Their
+   contents are typically firmware scratch areas that carry no value
+   for kernel crash analysis, so they are excluded from the vmcore
+   automatically.
+
+2) Reserved-memory nodes carrying the 'linux,no-dump' property.
+
+   Device tree authors can add this boolean hint to any
+   /reserved-memory child node to request that the kernel skip that
+   region when constructing the elfcorehdr. This is intended for
+   firmware-owned carveouts such as GPU, DSP and modem memory, whose
+   contents tend to significantly inflate the vmcore without aiding
+   kernel crash analysis.
+
+   Example::
+
+       reserved-memory {
+               #address-cells = <2>;
+               #size-cells = <2>;
+               ranges;
+
+               gpu_fw@a0000000 {
+                       reg = <0x0 0xa0000000 0x0 0x01000000>;
+                       no-map;
+                       linux,no-dump;
+               };
+
+               modem_fw@b0000000 {
+                       reg = <0x0 0xb0000000 0x0 0x02000000>;
+                       linux,no-dump;
+               };
+       };
+
+Interaction with other reserved-memory flags:
+
+- 'no-map': the region is already absent from the kernel linear map,
+  so it does not appear in the vmcore to begin with. Combining
+  'linux,no-dump' with 'no-map' is harmless but redundant.
+
+- 'reusable': the region is actively used by the kernel for movable
+  page allocations (CMA) and its contents are relevant to crash
+  analysis. 'linux,no-dump' is silently ignored on a reusable region.
+
+The property is an operating-system hint; DTBs that do not set it
+retain the legacy behaviour (all memory is dumped). Architectures
+that do not honour the hint simply ignore it.
+
 Contact
 =======
 
-- 
2.43.0

