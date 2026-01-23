Received: from o47.p25.mailjet.com (o47.p25.mailjet.com [185.189.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32E1DD877
	for <loongarch@lists.linux.dev>; Fri, 23 Jan 2026 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.189.236.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183795; cv=none; b=hQrbhr/j+zWApTX+wA23g6GlkdQ/WdaV0ZYXyafgxPJxZoiYp39PYUXgC+TkzDJ1XzARYlxQji54Is/cj7YBBzNARoUK85Dj190XLsiExFqqpbiACgzY1fqO5T2EtOnKMy4q8E7j0A1dTfqTppwGw/ATYr4VAxNrLJ7wygVHyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183795; c=relaxed/simple;
	bh=n625F9iOcmfm4oeosR440PIXnRGSOWmz0lx0rm52p6Y=;
	h=Message-Id:MIME-Version:From:To:Subject:Date:Cc; b=pCBD/nY79Z4mVbtD3PpP6Xr8YERo+wz14S9nSGOSf7JHt+oAijToV393KiVF7vBVi4CGcsye7FT9cJS/5u4P2vhlKJC/vX7z4KX5DAyd2T4XCJrDbrEwaj1Np05ZWDlrBgt0HskW1m+V9OMdEPxUhRDFMOMA5nVU9ju/45aUQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csmantle.top; spf=pass smtp.mailfrom=a3364097.bnc3.mailjet.com; dkim=pass (2048-bit key) header.d=csmantle.top header.i=rong.bao@csmantle.top header.b=om/F2B/3; arc=none smtp.client-ip=185.189.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csmantle.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a3364097.bnc3.mailjet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csmantle.top header.i=rong.bao@csmantle.top header.b="om/F2B/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; q=dns/txt;
  d=csmantle.top; i=rong.bao@csmantle.top; s=mailjet; x=1769190989;
  h=message-id:mime-version:from:from:to:to:subject:subject:date:date:list-unsubscribe-post:list-unsubscribe:
  cc:feedback-id:x-csa-complaints:x-mj-mid:x-mj-smtpguid:x-report-abuse-to:
  content-transfer-encoding;
  bh=n625F9iOcmfm4oeosR440PIXnRGSOWmz0lx0rm52p6Y=;
  b=om/F2B/35iV6PjjQluBBHN7EFbfiAyvEGJ0DZHQymkOxXWNxxhjN4CUGa
 yKLwJX4PJZw4/IlZ069Gfg5v/A+cKREirXEkY7ickPOBMgQjHIKjsqDi4/5l
 wEBgkFa5QB5lySVq4IvvJfcx6TqGnBSqigvlElIAwjJsEXly1ANF5qgYoZSw
 af9MqZzS7Mi2vkCFxmVW23fqjm1rcaoGHEJt0bfo1UODog01Mg19z8/YjNJV
 DUhPp9yhCfrwFaHgeqUPj8mFAEL9PLxg2P5bH0LPLbfo5OiNJTl8OWf8E5Kq
 htWWP0wnQ3A7Yo2wNzfO/5j8QoLhcUWmfAXru7d5NkRJg==
Message-Id: <e18efdbb.AXMAAIuqLC8AAAAAAAAAA-ma1qEAAYKJPtkAAAAAADNVAQBpc5ot@mailjet.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rong Bao <rong.bao@csmantle.top>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH] loongarch: retrieve CPU package ID from PPTT when available
Date: Fri, 23 Jan 2026 23:56:06 +0800
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>,
	Rong Bao <rong.bao@csmantle.top>, stable@vger.kernel.org, WANG Xuerui
	<kernel@xen0n.name>, Yuli Wang <wangyuli@uniontech.com>, Yanteng Si
	<si.yanteng@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>,
	Hongliang Wang <wanghongliang@loongson.cn>, Thierry Reding
	<treding@nvidia.com>, Tianyang Zhang <zhangtianyang@loongson.cn>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Feedback-Id: 42.3364097.3062169:MJ
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AXMAAIuqLC8AAAAAAAAAA-ma1qEAAYKJPtkAAAAAADNVAQBpc5otLd7pyPAUTR-76XDDX5rlTwAuuZk
X-MJ-SMTPGUID: e6c17ccd-6fab-4083-aa61-d129a700786e
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Transfer-Encoding: 8bit

Currently, the LoongArch CPU topology initialization code calculates
each core's package ID by dividing its physical ID by
loongson_sysconf.cores_per_package. This relies on the assumption that
cores_per_package counts in the same domain as physical IDs.

On Loongson 3B6000 (XB612B0V_1.2), cores_per_package matches the visible
core count -- 24 in this case. However, the physical IDs range from 0 to
31 in a noncontiguous fashion:

        $ cat /proc/cpuinfo | grep -i -F 'global_id'
        global_id               : 0
        global_id               : 1
        global_id               : 4
        global_id               : 5
        global_id               : 6
        global_id               : 7
        global_id               : 8
        global_id               : 9
        global_id               : 10
        global_id               : 11
        global_id               : 14
        global_id               : 15
        global_id               : 16
        global_id               : 17
        global_id               : 20
        global_id               : 21
        global_id               : 22
        global_id               : 23
        global_id               : 26
        global_id               : 27
        global_id               : 28
        global_id               : 29
        global_id               : 30
        global_id               : 31

Retrieve the exact package ID from ACPI PPTT when available, in the same
style as retrieving the core ID and thread ID in parse_acpi_topology().
Use this information in loongson_init_secondary() when PPTT readout is
successful. The original division logic is kept as a fallback.

Cc: stable@vger.kernel.org
Signed-off-by: Rong Bao <rong.bao@csmantle.top>
---
 arch/loongarch/kernel/acpi.c | 9 ++++++++-
 arch/loongarch/kernel/smp.c  | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index 1367ca759468..82c7ffd4f1ac 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -176,7 +176,7 @@ int pptt_enabled;
 
 int __init parse_acpi_topology(void)
 {
-	int cpu, topology_id;
+	int cpu, topology_id, package_id;
 
 	for_each_possible_cpu(cpu) {
 		topology_id = find_acpi_cpu_topology(cpu, 0);
@@ -194,6 +194,13 @@ int __init parse_acpi_topology(void)
 
 			cpu_data[cpu].core = topology_id;
 		}
+
+		package_id = find_acpi_cpu_topology_package(cpu);
+		if (package_id < 0) {
+			pr_warn("Invalid BIOS PPTT\n");
+			return -ENOENT;
+		}
+		cpu_data[cpu].package = package_id;
 	}
 
 	pptt_enabled = 1;
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 8b2fcb3fb874..409e49d4da37 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -412,7 +412,7 @@ void loongson_init_secondary(void)
 	numa_add_cpu(cpu);
 #endif
 	per_cpu(cpu_state, cpu) = CPU_ONLINE;
-	cpu_data[cpu].package =
+	cpu_data[cpu].package = pptt_enabled ? cpu_data[cpu].package :
 		     cpu_logical_map(cpu) / loongson_sysconf.cores_per_package;
 	cpu_data[cpu].core = pptt_enabled ? cpu_data[cpu].core :
 		     cpu_logical_map(cpu) % loongson_sysconf.cores_per_package;
-- 
2.52.0

