Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA22E040E
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904512; cv=none; b=PaDiTTLUkLqPZ3wZtKWfja+QCs+Xu8K1uR4DMNQZZ2j/DgzUvdTXIaBTXfwoLQElZeb8kMxmoQuwJ7XEIf4hqszVzdWLwWZe/q6b3rhV8wW3I61XTIztETx9aFPR15l9/HEYNqLMPRBMznUETJ/Y6XSRpYZ3gKEZZzbQ9oP6LDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904512; c=relaxed/simple;
	bh=TxDsANSYkY/rtN7uqqxyADIxZrD3oTuk8v/DtW9VjTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YfyKJcfFMefx/oukYRSLeFuCSs50r+t1jd/vQHVHcYY4KsyEAWT070LV2aY1xic22FXN8ZSPhASDxi6UOmQKLAVmnEjyMBJOUeF6ko6/MsizyO57FVjD7Jm/lthWi2rvESOukqhMIu72lQsFEK5QAVVOg20mReAgCqWe8QzDWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f9RO666z; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f9RO666z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754904506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PElj3O+nt9JkRibcu8eYjPBnu7dzdN2l5hUggEeCVbs=;
	b=f9RO666z7SlP1Xsw4N01Pdmzbe9xXH7Lu63qZvxV6a48js4Dv6akRmXPYlbeb5dgoAmYOH
	xEfy6DwQoZV2sJdxNl0TlU3UEk9NmLuIMJnEIgCl5FR0fw5twrTZpgOSqQyx+UE9v3coNT
	p3r4GLhYyhaW+b9yhKkSMDsmn9SVRJY=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH 6/6] LoongArch: Enable CONFIG_KEXEC_FILE
Date: Mon, 11 Aug 2025 17:26:59 +0800
Message-Id: <20250811092659.14903-7-youling.tang@linux.dev>
In-Reply-To: <20250811092659.14903-1-youling.tang@linux.dev>
References: <20250811092659.14903-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

This patch enables config KEXEC_FILE by default in the
loongson3_defconfig, so that user-space tools like kexec-tools
can use the same as the default interface for kexec/kdump
on LoongArch.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 34eaee0384c9..6cfea2f37cc0 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -45,6 +45,7 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PERF_EVENTS=y
 CONFIG_KEXEC=y
+CONFIG_KEXEC_FILE=y
 CONFIG_CRASH_DUMP=y
 CONFIG_LOONGARCH=y
 CONFIG_64BIT=y
-- 
2.34.1

