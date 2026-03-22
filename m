Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D3181334
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774167615; cv=none; b=qdFa68DGD/ptSJjNv9Z5G/QK3IUUjaXyoQaz2C5uQePv2ILPFUPg3w+8+KfmLpIaV3WDSCpybqaEQNvnHSbqMc4JYWfwql6J9RU/LG/z/4GGPCijgmiE51t1kds4RMRdWZ5zon+bNjxXOkCfB58bQmASWM/zU3bkRrwZWCe2MRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774167615; c=relaxed/simple;
	bh=0LQwJMRbJdSQxU/+GHhXt/euS9iBnyH8taGILmEqCj4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=OEA4VW89lJuQzR6pw1UZUA89AbXulUJvhx+ELw/FsAxke57vL8SrlBVzZkmFCK4YR44kqJ2/gsJo5wHJ7Bnc3kW7MQjoJr7X9dGN0b+4p0dcN3pda9Rp57wUbKLK0bKShB4zWThO+fDPryGVcSks7mEQPg4bTFT4driqJIqigw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=At/acvnt; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="At/acvnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774167605; bh=Ek7o+/L+/XZU4I6MMx7rsjwmCufsPu3iryoYmXpIStI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=At/acvnt3wCkLgWgZRGg7z1JQ9Gha8C3g79yu8ZQ7k/g4LR25jJ5JX3yKOflSFBcc
	 2rj8eUDWGOzLd1/GjYDI5AafRa1gFL5Ugsv/PHOOnu1eCf0EV7Dod40Hgh7PqVrjD2
	 m7NX2t0R3KEF3+71z8aohgcPoMrYUCywYYhMvGwc=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 500854EA; Sun, 22 Mar 2026 16:20:00 +0800
X-QQ-mid: xmsmtpt1774167602tl4dn5e4w
Message-ID: <tencent_1EA9B7D351AF8169F880BAAA49B37E178A08@qq.com>
X-QQ-XMAILINFO: MlsYLnHA0UVjUKzXdX4ErweAsBGGRwO75fbGdd6Cb8+K5ODUk9KlnQ+sEtXrci
	 /ybqf1WpzxzqWMFl4GYF1vb34VMLWKdNqmFLJCrt3caWgRmtRLMeaJ9C51J54EwUIIGj7SM9GhOi
	 D4Fc82SaBe5NvTGfN3P/veafjCZytnRHYLJi0WZDDKqhaQVe3QUhPj9+12hOGATQp3fTBjJkq9D7
	 zzH+sgJfsGsk2Hbrkh3xTF3Rt9qzwXby213JdFxb3Yro9x0eRBac+i+zJLJtVFDbNlh2gcpJ7q7k
	 MyNa/9i76GA4B+qV8gjV15rBm3C52e0KBMcv5CbPsFL0g7KA3voNqobixdfsSAJ9d3+QE16CYMPa
	 BniFXnL1lhLuDTsnszkX5tCDiUjBh8AmngjxE7IHPaqINNHdQy57PfPFxDCWjpNpTMKeZzh2OhD8
	 dAmWAjAsXcEqiA98P4g4SSukziU2nPiODXzvFCdrHRKQc4NC1GliE5H6zMYsXLp2IHa6bWSzjfjt
	 DFK8Ksl+1K89rZXTuMZSPpAzKrVYYEYrCpUJCE3OLQRRuGuTLqtrspUOajHiH/w2/N0FMfmb20DV
	 IaaNwjAqN4BDp/msKsTdv32FJw+ad5nnbeZn41rK2wO6InGr3dFOJ5neh3vAOQMmtZUVzY/wn2oY
	 ck/4Nt8ZINoaqxrrkgP5O8wjzOC5vgjDPPlaEDsRTmofj1St1FjAnDvjvQU7ny1cOiI7QKQ5k09n
	 W86q5hBNKSFcbutmiqpjuqiUUOd1VMAuK4dKu9Ix9oWb0seLYDXI0MBBQUyLMzQOCN7+8n6rbJoU
	 cIlk8dbrx4Z/aIEY8wRVT/2GTRx+jwdrCWJTddrCx7Oyrb1RX6rgUn8PfeptHcOYZyFKPnVWLpKO
	 kUu8j63ROsqyJ4NfluuEM3fQvsgeEdvc8tW0zZyCRMgqpcUgjTs1UmonOcXb6w0BGf+KEPBcXATO
	 ftJaGpXoRGZ1U/RD87/00cJGmAst6SnhLCQLJVz/xZuWd0HNqfiMBW5stYgIV3pGCeEKPA0t36bG
	 K8Q6tnKwVwU6I+LXYtDZY+XmOE8D+YCvS6Mbotzou4r9HOHKsPp4e5mps62KZCVwNhUGBZW0b1/C
	 79tn3HyC4uxlqpW9bX5nR2jSFUViBvJtm/+IM8QmK4f8h4DIk=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	zhuyinbo@loongson.cn,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	devicetree@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: loongson,ls2k: add ls2k1000 compatible
Date: Sun, 22 Mar 2026 16:19:14 +0800
X-OQ-MSGID: <20260322081915.1626723-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322081915.1626723-1-wjjsn@qq.com>
References: <20260322081915.1626723-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a SoC-specific "loongson,ls2k1000-clk" compatible.
Retain the existing "loongson,ls2k-clk" as a deprecated fallback
for backward compatibility.

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 .../devicetree/bindings/clock/loongson,ls2k-clk.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
index c07ad1f85857..4d70bc4e7a13 100644
--- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
@@ -13,12 +13,16 @@ description: |
   Loongson-2 SoC clock control module is an integrated clock controller, which
   generates and supplies to all modules.
 
+  The "loongson,ls2k1000-clk" string should be used for Loongson-2K1000.
+  The "loongson,ls2k-clk" string is kept as a fallback for backward compatibility for Loongson-2K1000.
+
 properties:
   compatible:
     enum:
       - loongson,ls2k0300-clk
       - loongson,ls2k0500-clk
-      - loongson,ls2k-clk  # This is for Loongson-2K1000
+      - loongson,ls2k-clk
+      - loongson,ls2k1000-clk
       - loongson,ls2k2000-clk
 
   reg:
-- 
2.43.0

