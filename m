Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36953806B0
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774160919; cv=none; b=ZkTVUaXbQ+hsZUEnN9KjX2gv4wYWw5SCxQh3pxAMv5C4VrQ2UDKsAZvcGWIMQfzPUVDw2h/MjEWP/tsEGHlkjsTRUzkXZWRC6SVY4iTcz15uUnojyi447tkHakV54eUo75MkUgrt7K/tRAwot3swdqFBETJoYJEFSs8oCihv624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774160919; c=relaxed/simple;
	bh=8hzd5kWDQDr9xSvMA9TSyJHxr0HTJ5N4J0FZO7E28EQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=R8KW7twFrDkEKuZKzXZlZGj2Ju9fmvSFDuwnynvES1Hd486M8tYxZGepazyfVi35aPR25wuCXFGAg4MgN6I5eWuaA4A8vcGoJk4aC3Bgcjn621K1SlcU1Fi902nbLAG0EY4ba7YCi6JBfOMt5OLClyigMaWEVjXFcE/5TE8WifY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nE5MdkSD; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nE5MdkSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774160909; bh=psx/uMUrsohcUH5ki+RW495WuEDiSi+QRgpmAeeJux0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nE5MdkSDM5bjrwLrqEeY5k90+OXaPIikKO6rJwBN1MSlqg9EXG0SK1pYa7WiKYpTP
	 8Bc58ej73t5LrxqppZKxeY7MYacfNSvjE1VIZrhmfHndxxZN7XCxT8mu+od+HfvyCY
	 81f9dw7NOEF+bMw8I75xfP1gXwkkGzTPcNMtgg/k=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 7198DAC3; Sun, 22 Mar 2026 14:28:25 +0800
X-QQ-mid: xmsmtpt1774160907tzvciehoc
Message-ID: <tencent_604CE7BFCEA6AD015AA9EECC3E5C68A5C20A@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7eWC6MJnuvMmViAHhuCNzPPvERT8f6x9nbzq2MzYgBDW3Vl9uMM
	 EYMHMomN5Lt6E4/5kZ3O1BhT1BoZGUvpiFzlmcU5VUkU8onR1Is+d1dKgJ/U53PCyFuWZodLwMNy
	 oHIgW7kvwkJa/B1e7TKEEMC63fmg9+Jw7QaAJ/Is9gjMVmFdWPKJ3eXWWntyZK9bw8Mib+EwnBTO
	 9W+ek0IEArJ9NijKRUcJl5GWobqnimanNzHpuWu60dc3nUJkdawj9TGOL/v1L4ffygWGILf73sbD
	 cTWrMJRcZJ67AGCNtwfsfHIF1MPhhHCOM0zqt6m34Sag+6tCeBD2hVU6/EkSLDxrx7US6uHMmbuS
	 kcqBKYHQJU3Y1+ktrKw2grMgHCsZounnAp4iJIQN/Bl2BElu8vCheTtq4zipXMqIPmvMCdkqMrex
	 blKyKXYRTahdD8WSLI2w8GUzukJ3P01f9n4OWcwfFPASzjiip0uCoYNM7KZxgYd8JFN65Y6SLsCR
	 0zkrzRPTbiRarlom2F3U0v6as3urojP6iDzKxMWUnOR2j8QPNnHTEpeExaEqQ+p/G7oHXPQL8wqq
	 9qU0Z3cE/mPJJqZ7BPVy9WcNa3LnTq7KPSEtOvku2k3NwhxOWQCF3D3ahrwqxLFF0N8fLpW9RnsM
	 H7b6zjPJd7xYosj46w4PP2xTqItXIAo1o1+g7Zj/KTPRlkrrVGs/w+UW5MfIBcZCLW2NW6RtW6k2
	 DnFrFFgu83/HgsCivJVFXmGkKUuDndoPGJ/R3B8klDmumE6hpsaUuIEKNDFw1Olq2uRTOdrUhrAM
	 L1Z/HlBmasyHXIY0x4UnWdXpN0eJWUKlSG64s+y8lSl1Vq9M/pdFUM6/k7nLMz3c6hcNLD5OXBRw
	 WTFsph5sfWJQ+kWdJ3yqfEqPZJTt0DXTbTtAYsuD7TJxbcfIiWY92ksl43VXYNQIa0ZIb3sgX4XO
	 YGLOLf5L/NEcqDvHv7lTQU0XylToOnZTogA3Bu+skCbuCJ1zoWei7msxM3Q4NtUWsntkeJJo1ISH
	 OpEuFoehLyImYGDGfDi4ABg+W24tOFYP4KQQfAofqE2UIgoJ8hx2i928lI4Mg=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
Subject: [PATCH v4 1/2] dt-bindings: loongarch: Add Loongson-2K0300
Date: Sun, 22 Mar 2026 14:28:22 +0800
X-OQ-MSGID: <20260322062823.1413724-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322062823.1413724-1-wjjsn@qq.com>
References: <20260322062823.1413724-1-wjjsn@qq.com>
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

