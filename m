Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C71C2DB2
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758177944; cv=none; b=W7S7uQ4aP5RKLMMkhpU5wZaJEKYevmiRmMS9Sv1ZC4cqYm04H8Yo1huobPzhrMF2UPJTAC3AS06W4DfBfeo2T9W/wRBggZGJgbH7g7lkFCxfXbnJIXauQqvuB2wxh1B7CZVIT0IuVEoVH49dbEkiKZaVF7RIR1y17EKdAMhr1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758177944; c=relaxed/simple;
	bh=sTnRaHgX/E3OYmsyP/l8gzNfVk/50KS7tLhRkCXC2Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ss7V6LZwdY4Lh/DkdacLmd676ZevH4mmf7bHuc9Kwhs1kHDFX46981uwsE3TcsV6zI8fplJpZ0/NzZyhB78mL7LsgcUcJlcgxP+lApI71loHSZykIYYYPAqA+mZ/3qwUrkV/O4BitNXHs0QUKOvr0Z8VZXdudZgRB2wA/Xs8DBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TKfHsa0A; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TKfHsa0A"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758177940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=frMGU+6gZkfURSvTwgSB9PhFpok35Fde0U/zq47+Nyk=;
	b=TKfHsa0A1Y9CX/loX+VPKrqv/SfTm6XS2XF2/le0P6gJjnDWbBf+O+OL+u8FqaIGuBWP9i
	PB8xv05DEGgCdne+cYgo29qtQmHEXt6J1ohYh4SQLWPgIoNqRT3mzgES3P9Zp+SOgNQmdc
	35fHgehXssBfqiaTLzM9F/wLIfnojYc=
From: Jackie Liu <liu.yun@linux.dev>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	liu.yun@linux.dev
Subject: [PATCH 2/2] loongarch/env: fix missing NULL check after kstrdup()
Date: Thu, 18 Sep 2025 14:44:48 +0800
Message-ID: <20250918064448.91647-2-liu.yun@linux.dev>
In-Reply-To: <20250918064448.91647-1-liu.yun@linux.dev>
References: <20250918064448.91647-1-liu.yun@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jackie Liu <liuyun01@kylinos.cn>

The result of kstrdup() may be NULL when memory allocation fails.
In init_cpu_fullname(), the return value was used directly by strsep()
without validation, which could lead to NULL pointer dereference.

Add a proper check for the kstrdup() result and return -ENOMEM when
allocation fails.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/loongarch/kernel/env.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index c0a5dc9aeae2..b41a65ec45c3 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -49,6 +49,8 @@ static int __init init_cpu_fullname(void)
 	ret = of_property_read_string(root, "model", &model);
 	if (ret == 0) {
 		cpuname = kstrdup(model, GFP_KERNEL);
+		if (!cpuname)
+			return -ENOMEM;
 		loongson_sysconf.cpuname = strsep(&cpuname, " ");
 	}
 	of_node_put(root);
-- 
2.51.0

