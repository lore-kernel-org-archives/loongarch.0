Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2112BE644
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192843; cv=none; b=WPBZGyB0mrv5pOyhTGgF7lLVw8/xSMyY8qdjJquvaJU35B9JShJET4cMdju/iE8cn0fvsplEObhncZ0euZazAfremOJXEBOdK5NRtbrEmEgGXlsYQBItAnBEYBLp7s73aN8ZlyXUXTTiVRzSys/6wM/1OShNO9kX66IkXTuDzMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192843; c=relaxed/simple;
	bh=UsBFqT751fqj1GSaIS5WEL2XOVFynW1xqZ+i5MqRW1E=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=dgrH+wrzijnQfnER6zxQTf5j8N7UxL4qhwKUIYoeq1JPbkeYVvLcceMkZ+q9p8bvUBNu5Y5gGLTRWpS+9e+x4MH5r+nSf2ie79bacgFZGhfjpcPkFX4mfRBYdw0qFrVu/odX+/yWh0CqQH0fNTieyr8uuJs5cZ4Jl1tX80a6Ads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EbxQ3Ntg; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EbxQ3Ntg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774192834; bh=8Yleymx1A0fs8KBrYdxBM7Pwi+fKXyiWQNoCBDpI8dY=;
	h=From:To:Cc:Subject:Date;
	b=EbxQ3Ntg+cIZnt5/Ej4LjuraS/uw/qXAiNLuBnovzp7zoCX5l2HxnmGfiCvllVKpt
	 zOOhhqD3izbbSQ8tsDbnumSNZJpJIIS0sDR0n5npcYz+K0r2O07N9x1d40bVOIHDes
	 KzYDuxm3noMd2QpOQJGp7BIl5q9fZHZfEf6THQ5E=
Received: from MYJGMC.lan ([122.195.139.226])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 51F9320C; Sun, 22 Mar 2026 23:20:31 +0800
X-QQ-mid: xmsmtpt1774192831t219dhr4m
Message-ID: <tencent_42EBBFB2A4110192AADECFAA5D48A7F64D0A@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0C8j/Zk7/M2oxadHfTG0dEUAK6KwIfQv4y0Kfw/AXDxa4CevNWP2
	 pn//YUmCMHmYqr065T86C7vWPTavx+UK4NyN5W5ZBNZKyhWrwikgzOkMnMEYpieyC5l7YKfKoSxe
	 w4Fa0Z+namJ6ikhWDtxwodo+gn5k3rE39L4O77JhTPHRLkU9KZgvuC6BwwIoYqCoTYw8othTLc+Q
	 w1jIUzpA2r1qwOZpD9NcNRi7JgkP75f1Nr689TphYYBfYvDD7fF3u4XuxE8NNgX7KktJJh8Uveue
	 7rIiueRJ7O4FyGgKCOsHIF0QORmLSQQx45Gnh5z2Jcq50z3TQ45o5JJ0lh6SlU+f7wkJS3J7mo1h
	 aZLm35znw0RVa6vf6zH2soCC+suwiizf1Q3mF4P4jZOdzne/q1k2LqxRamHyn5mNYWku/PlRWq7+
	 k/AFfJYswrdq0j5aY/bhLUQiftW7tzJdnmfN9gIgS2XdGjQiJiQqSL0jD+P9zOBDe/0Djr118mj9
	 9/yJmvq54VmYYuW+UskOzhDB0HYUqbJf5TXOADZTA0/8DWUr+6LpaLs9WUERg0xoOT6bGKXfiQho
	 0usTWfhKwz6TkSNbfXciFn+aGJDD88MbEuznVlsT71MZJfv7jTCywk+EgcRVw5m3JPsvyM5ch9eE
	 xBPDDI3CeDr1udtKp30kFPSXms2QtEhYCC03WTodBe5xbTUdEMCEE0V2bXmEeHc45Q/3dRvROp9V
	 omCaH4Ps6jSXSmImungsz1YLxcCy71/ybr2T+EyqJDKvpuekSZGqZoK+Z/njVYzv8MPija0B2mr+
	 ySDGfU4TfI4ctim16Bu27Kbd8mrnJwR+4/+lIk773gFQD86DJ4xxd2a7vDEkRytLr38E1MfcHE/G
	 tSUfZn1Ru78pxRi7TA4CWDmr7C6vyn6sOhoJm/Ta8/AgREbKGElrs6HRkBhm0DAN3bJMEVaCv/nB
	 T19JFOcY/NOhkaw6LzgUvon2Nas+/YxIjE0Px/z+AR4jxkhcWg5lTWZXf0Oe5h1K9iPAOLS4iZzM
	 8Bmz7IsamLJfcb/THCYvkWKDY5ydLi/+4mTBRhkoaNDb3okGWw25dTUP/JqwszAXui4QA3bYt0No
	 75Maiw
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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
Subject: [PATCH v3 0/2] loongson2 clk: introduce ls2k1000 specific compatible
Date: Sun, 22 Mar 2026 23:20:28 +0800
X-OQ-MSGID: <20260322152030.60257-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Use 'deprecated: true' property for the old compatible string 
    instead of just describing it in human language, as suggested 
    by Yao Zi.
- In the example, the 'loongson,ls2k-clk' 
    has been changed to 'loongson,ls2k1000-clk'
- The order in loongson2_clk_match_table has been adjusted

Changes in v2:
- Consistently use wjjsn <wjjsn@qq.com> for 
  both Author and Signed-off-by fields.

The "loongson,ls2k-clk" compatible is currently used for the
Loongson-2K1000 clock controller, despite being generic.

This series introduces a SoC-specific compatible
"loongson,ls2k1000-clk" to make the binding more precise and
consistent with other Loongson-2 variants.

The existing "loongson,ls2k-clk" is retained as a deprecated
fallback for backward compatibility.

Patch 1 updates the devicetree binding documentation.
Patch 2 adds driver support and updates the DTS.

Regards,
wjjsn

wjjsn (2):
  dt-bindings: clock: loongson,ls2k: Add ls2k1000 compatible and
    deprecate legacy
  clk: loongson2: Add ls2k1000 compatible

 .../bindings/clock/loongson,ls2k-clk.yaml         | 15 +++++++++------
 arch/loongarch/boot/dts/loongson-2k1000.dtsi      |  2 +-
 drivers/clk/clk-loongson2.c                       |  3 ++-
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.43.0

