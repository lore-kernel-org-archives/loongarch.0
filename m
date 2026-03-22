Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355F2C2349
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 05:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774158654; cv=none; b=MPFByctoUQ8tlgDrVtUqy4kiWc8d4S3vpUynmr8GcvMr/IwfEuVPdWJPZmGWv+Gu29Vzb1PbOyQXLceOnhXxlntK5H2J+S1rK2oJU1V7RD5wRWoHLVc0nbCB6r1xxLKzGHRjpQi2EdOJcKZI18Zr1MVDn7dyh6kklYWEuPyjcMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774158654; c=relaxed/simple;
	bh=XPf328qGFEw1pVlLXZ5y8Tx2mnF8Iq/bSTQuF6C/VYw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=LadrGl0mjNOuR8JzOvn9L1VSa+Bzh4JhNxiIYDkcHhJf64gbdKzefNmQdbSdbztwXBsbuKn0tqIm0BzZzeHrCAKmH1qwOEts+z9U50cYTc1hyhHVv1rt9pY+8GY8PGzPtpQvrkRHfhjmZ+Yqb3O5BM1naUjVw8CbPhqAyJpggQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VvPRSrWb; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VvPRSrWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774158650; bh=Cmi5rfP0n2HgPLfCpAiQMoYzVU4WPdtQAl7hGiIhsV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VvPRSrWbiTuK2IdJoCcwpsj43d6XCHCQeN4BBbLtUVxLrLsTLRWJCk0dWiQG3Fwty
	 fObKL4eoSb+wuhpOWu2gMhrV5bk3Au4HtV477xWcUZqMKaiqF9U/MIDJiyNeq8riXe
	 VnTchaPYKonRZjHaxNf7FE4qzEgGrclUaSUfzZCY=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id CA83BCED; Sun, 22 Mar 2026 13:50:40 +0800
X-QQ-mid: xmsmtpt1774158641tjierl8sw
Message-ID: <tencent_5DABD4FEE9B9D7E6B41AC002D5F959928B07@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJqcnwnva7b1HsBVXiuKAqhHqOAdcAg5TovQSzKi3w2hWniT7a8A
	 +8WzyiP+uxmXPmXcmd0KNPTtLnhC7r35wJXyawF5y4L6lfl5adTXVC9hx9zMt0jYO/W+41JiI0kv
	 DcGiZRfl+oGTcbzu9vFtl//JoQft9C/mwHOGAxc649VsQ/kRC9F9d10IMgBL6+8vDmYUcGnkkOqV
	 fqz1iEJ/qOU/1ZVAolKZK/d+3e26ZMWARC9RDbUHLKSLCWb2bWyDrCApjKVB+A8PcODID/d1UWHv
	 K+1h+d2nF46zSn53WbSXIlE6v03eJAkvIDu/DF1OUv8VyLiCDHUF0fuG+2y/9o/ZorRcvoSw50bX
	 8xtX4mXi6uQa9iCN7F5wvH6MXNduGkLndaaAbmFFaGJuHkSiP19slQnD6OB+J/PcgSik5mmjW1Ad
	 pau6IM0EvVrGLEDooIORYWqufxq9gHMxp7ADEqbzsKedA6aNlR3YMyyZR0eorWMDZQcAODA6ION0
	 NxmjHaKsFw0EjKqZUgPyG9e5BVUs7Dk+lfEPodx+C+IzSGCrtEOYr230DG++/S0YTzTCU2TBwxFQ
	 NBZVGycfUDCLIfzLSthHIsElvaYT4ySlAaTXdei4YPt9N/qQpuRTv1epLE51G2UtD3nNcAYDGtzn
	 xCvzm8g6IjswgNVkKCA28xX+DWG4boGDjEDuTXNytz5MRCf9YzXvM1NFoufd8OUZ6JtoT75lyD3s
	 nvTwmZP4fRqA2lC0zZLvjQAkYkGnCcr+3TTBSalR6e0Qy5s00zEN9SN7HlOaMHMf3IQLokkPOJJV
	 CdkPST7CYuoB0XV8V/d4NAVNPy+tHbLo9ZjxsaNLQAptICSyyZiNR4g8QfuCP8Qz2BQH6NMO722O
	 R5Ks54JWOtRv/RmmruOLB53XxCNqntSksn6Nolso+SKSg2CW1aBAqnaC/GSymoZ/C4kvu55EnVN9
	 5mcoOamPJtFCooIXk8VjvMYjg5/7Y2EDW2LPWON/21YmeHZmhaG5kqcgf5hNLiM1SVVkZ9hk67yy
	 hJBPOkInaC+jILe9YjjKlGiVImRC0=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH v2 1/2] dt-bindings: loongarch: Add Loongson-2K0300
Date: Sun, 22 Mar 2026 13:50:36 +0800
X-OQ-MSGID: <20260322055037.1358712-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322055037.1358712-1-wjjsn@qq.com>
References: <20260322055037.1358712-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 Documentation/devicetree/bindings/loongarch/loongson.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
index e1a4a97b7576..8bea8b9f75b1 100644
--- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
+++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
@@ -14,6 +14,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: Loongson-2K0300 processor based boards
+        items:
+          - const: loongson,99pi
+          - const: loongson,ls2k0300
       - description: Loongson-2K0500 processor based boards
         items:
           - const: loongson,ls2k0500-ref
-- 
2.43.0

