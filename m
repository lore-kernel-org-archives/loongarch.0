Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52646364930
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192130; cv=none; b=DPbSydU8GsWHqNhIsvBnR0/XIKtqrD7P74BZ+14amCZJ8WpMycpVxaNjvL3xjVeHIbDsOcu0z9D4lAWg1V9hC48ngZN45PPscb2UYkljW8QVLgnWI+cBvE3mdZ9mYif+qkvxb+/AvIbV5Ee1/Ss9yEAVyFdA4RFUMNJRkgN8LVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192130; c=relaxed/simple;
	bh=q4bOUqGuZ7HXf0K9kPY4nu3pTFQN3ijaAU61RrNJfZk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=dcx0CtZSV2jiSzweGvZm6bM0avG4X+4JHFQp7uHkhScX721PLso7+LPuAWD6mzNlRfOMWQVHilMtVor1g8o9OH1S9YbDWCK6VQFKgHAa5GUhXySdK+u4JQ5a+Ql41VdLJXIp0+42FMm4CfvuJWsr1CgOmEqmXdjt9qzRZsk6Eaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ViFWRu4f; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ViFWRu4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774192120; bh=Hy+d5QrGTpw4ndlkWipXlCGQeYu0mvXSj49dCPNFX50=;
	h=From:To:Cc:Subject:Date;
	b=ViFWRu4fHCpkjMVhGtI1kWfggj2ilhRXDd9u+7HXwtAQ+Rd46lfG9qQy2KDce1/23
	 K84ffpBmCJl5TDT0cOxhuGV5adpV1kibO+mS1f/l53EE6DQrEm9kmCVD5ZancKLpgu
	 ewvbTd9kTPrwla4uMhzdj0S5bM/mCsWef8/Wjggc=
Received: from MYJGMC.lan ([122.195.139.226])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2259A43D; Sun, 22 Mar 2026 23:08:37 +0800
X-QQ-mid: xmsmtpt1774192117topis41yq
Message-ID: <tencent_AC8D0BB5D4C7698A57A6B42D4038559E5907@qq.com>
X-QQ-XMAILINFO: Nr4sKL92GIu+t4q8r0kflek3En1RRH0bONimUPSI8aUNuWqJ3VgyyPiz03pc4b
	 zNtZpwBGE4ht9CzVPMPE3gRvnpZ5enbEA9luU4sJPyfST24BfBXTYuUluA2xdK9rtZoiT9XN/GTh
	 o4DEhu1RuAXD99o72xMReVo7UhaTOit0k2mmSaAJoAlqcd7zHiynmfta8Zo2BNNRr4eL6pSSXMaf
	 YbtTERAUYUQiny2gSOtPdSUgvvN6iTWhky9RX7Nu6fHcAcN7hmGCai+IWpMsWK5ZUy8xuf/RBRrd
	 Yas0Zqqlzt8Yabe/HwCIGAB9T+9RbvxI8+fz4nAQCLLgNXNSuDIA4F6e6f+kvTYfhBzBOZz29gK7
	 kkO12bPEFN/BKCE1Fc703Fc9P2IQmIA1q513wbcLCxOCFLcogyEK3QpqMzg00TatUWpML+PuZtFH
	 aBngYi8ONYMd99vAwCbl69g/knhNQvePoOWBPKow+qzfup6PDDhdIvnjUO0HmlgHrMoZtb1/UAYs
	 19VswSgBQ1UqDSp36sAX1rhwstzc2Svmz/WzHryVsBhO2zoPLgF/+urTclso0sOkviMIjEYLaRjn
	 8KtOZFXzlEjcQn860AkqLykIKqHLZgfhq0tbfpyVbTtbhur3Ed3kaY0L64056/AcqzoJCPUr9E+y
	 5CPd2aJa0IDHN7ST7kP9WmSwgLgyXpV6Y9veA/i+1qZHkO0/3d6UUxiiukARrsHRXwDIK6yyE/Up
	 yQIqqIkTOb2e6XPzzzAmSUDLrR5hU2g1LKEorqik17gt0R3pJ/sWMttTfngJTC2xb5BwOvD+MQPm
	 /cCBctBfRtcYt5sdljzRkPyNpqXyhMD6y+nUtKq3QqEYSTSiuLHsHn47cHYyf3fRG6T4/fWfArdH
	 jFTZPuSyuedAVM+s4HfdWoOPs4PaRzcik2cQsHuTzzQeqjZezw7EDnEx8jdCc8j5IhMeItoVt6ko
	 JCrh9q2n4dRrD9S7qpulqYfhNsk4iCJR/yGTd6glQdqSBi0wF0s+ZSlOdM5MPHZ0IiCaDLGjl+RL
	 vSo4kBe76cxnfY8WqOgH4hQx3ix34=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
Subject: [PATCH v2 0/2] loongson2 clk: introduce ls2k1000 specific compatible
Date: Sun, 22 Mar 2026 23:08:34 +0800
X-OQ-MSGID: <20260322150836.55196-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- Use 'deprecated: true' property for the old compatible string 
    instead of just describing it in human language, as suggested 
    by Yao Zi.
- In the example, the 'loongson,ls2k-clk' 
    has been changed to 'loongson,ls2k1000-clk'
- The order in loongson2_clk_match_table has been adjusted

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

