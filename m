Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517882882BE
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774163882; cv=none; b=kIogRmxbTcLAF9zpkh/leOeR9L6pVlJ8CSqsVHwchOCsoTwOIXGukaOMkqfaD2w4ItZYOraeTBXf2FDw5oQFGNp95/rvw/GAXtjZXd1aj+uRn8uqb0566n97LSvDqI9sf+5aGy6OamM3WXEUNVC50GSNzIOx6A81SXs7rZp0Ubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774163882; c=relaxed/simple;
	bh=8hzd5kWDQDr9xSvMA9TSyJHxr0HTJ5N4J0FZO7E28EQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Y9dTnRjaKg0FRLn3+MWwrEplaDBxySXgeCgXGK1yXD/5UYxZSJV1yjheQVacJbclAPno2l+90wHpJKvbTgqu3kfcj0DOyE8LFV3viOO9LDnGikMSPDIySgBtRrmw7ZedBJD8RzYZMoxG0e9deaeLcilDd90jV6WZT98eBzkN6XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zYGH7MIW; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zYGH7MIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774163878; bh=psx/uMUrsohcUH5ki+RW495WuEDiSi+QRgpmAeeJux0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zYGH7MIWV4SESx+/DeTSQOatkfMCBm+d1paj5yf/YXqeQ6Mwi+JX0+2/6zPKWyn+W
	 XBW0Bcak/MDH6W3h5QW+pS/agguWsZNQjGKDn7N/70FtMKZDAmbjk4bpyZPDI7T8bG
	 7vVD/sfXJHmmtwzcOnpQ7DGkpdKjJ2yiY77BJlx4=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3A0B863C; Sun, 22 Mar 2026 15:14:32 +0800
X-QQ-mid: xmsmtpt1774163674tzlkf573i
Message-ID: <tencent_8A6776FEA23435635AFDB5244D1730431505@qq.com>
X-QQ-XMAILINFO: OJYupdf7O4Wt3OZWWtrrVpuNw45FvpdJB/GFMYSpTtRV6rQNP9xsBarj+C5N1T
	 rixu5UBhMmDhFwz/14tOnmrcfwb4r2p4NOVjHkW6iJ3F49rII8gr6oYXOrY5TPdwP0OLI3UTEusD
	 xliU/pZD8BN674lQHpPeMRgUtlm/xxNvMvTk5OgiSkldkUp00/CrxqTQuHQQOPdx6m+AY7WPHK4A
	 2ul/UnoSGLsrm4HG9tFPaojDW53xM2i20/vSzMnz+mm5C7KIcj8L2ZLgRbvpaz8mcJ77AUj66Hsn
	 yXNEZZ0OBVB39YcQvKcKCXeAgV0RimVJ76XSZDJyefB/HMkKeyVYWhR0P2eZ2nVenjIXOX+ZBNNy
	 bxJh4pWx6+r29e0jMCN9yoNCm+QtSMtn+i99KYs9zdkPS/UGtl5GhwJNUOdfyXa5wbwbgyXKRwlD
	 nzWeTr4UUHqWyP8a+rtRmqE7b5UNRNM2eDNOAufULciw0uk0LD6wO0Bh49tyI9pb2zClkMvkabjm
	 7sGFWnHJbvr2e8vqar4e5wAeJxFdoGqfqZCdmMODV12AJ/I17PrDFWveVF41J4bIzff6W206b4aW
	 L9qAMr4C5tG341OBmJNToh+Jr4rXxCYXEaOPjbIYkjyFltwWOAsKDpotHkkBM++76qjOG7ns2pf5
	 i+qKDKSLGYD+xhLa87K08e4CNBHy1MCszbdkB+Ya6bj/wuvH2iXWX1kVQw2A3lzwyYK/+qV7AW1U
	 5PXvWCtR9upYARq4iVFHHUUMqsjOA8eUB6o2B6zHgaCy+UI+sMllNST325u3eNaCuiWTBmNJ7xxZ
	 FNbspLP5Adz64u/7AlY4heKkZb0YvhPZL9Uc/Tuzml1I9hP/X6hjxnIv5m2iLQdVgbQI86yGl4sK
	 LQ6lBAcGHwbDBggyMpoYtP/HR+D7GOZf3wEU+xJ2YmBvCQOj3DuRQBrgwF2md6NQiP1jiQGSZPTK
	 aIF03Hk50xBqS/Z7uZyhuj67mRylQfCgme1bHobBW5EaWIweavduFM2rsDiB4mBRxVcgLkYcgJo6
	 uWWMPoAYAYRw/XT5a7Cpsc3+yQCGAscVqlHjLlSE5poeIMMbZWeSyZf2c5+w4=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wjjsn <2858482031@qq.com>
Subject: [PATCH v5 1/2] dt-bindings: loongarch: Add Loongson-2K0300
Date: Sun, 22 Mar 2026 15:13:15 +0800
X-OQ-MSGID: <20260322071316.1537953-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322071316.1537953-1-wjjsn@qq.com>
References: <20260322071316.1537953-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wjjsn <2858482031@qq.com>

Signed-off-by: wjjsn <2858482031@qq.com>
---
 Documentation/devicetree/bindings/loongarch/loongson.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
index e1a4a97b7576..8e0a917ffc01 100644
--- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
+++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
@@ -14,6 +14,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: Loongson-2K0300 processor based boards
+        items:
+          - const: loongson,ls2k0300-ref
+          - const: loongson,ls2k0300
       - description: Loongson-2K0500 processor based boards
         items:
           - const: loongson,ls2k0500-ref
-- 
2.43.0

