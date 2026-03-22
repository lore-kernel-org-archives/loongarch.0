Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670837C926
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159381; cv=none; b=EfGWOhhPvHDLqlNRsf6JkAjBuvF6uecfqbmcO/YrrQ7v2OOWz1tnfVY/ZPARrJntJYXWzdquVrtM599T0HbpozddrUHThNWua7yRS9TOrIpmCCrHN9yW3pWgGsFtWvvI5vOLYC0EoUcxihWbfjw3TdchsG32zS9uuNfBLjfebfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159381; c=relaxed/simple;
	bh=ZrzJpmmUYKdbYxYj7JlXz5+gHo754ncX+OJVSRhbFNQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=a0E7TXWxrF6PwR4So5z4HGyPmEuEkLmVB9DMnry0l+YRYIysEvX4DfBl7aNX/e2lenozmoIqav9EL2XqKYC5QVgVnGoNWRs3Ohnn/H443zSXYounf1Djl2+zltHooI0woK3dbQZcK9fX4mFPxszSnW5ItGqx7YlyUK71AfXatzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=TtRdFoaW; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="TtRdFoaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774159371; bh=PWjy4i6s6wYeKdVnAV5SQdcLX7Vht7TB45r2ZQP+jns=;
	h=From:To:Cc:Subject:Date;
	b=TtRdFoaWQy6BruyCbY3+PnT4ftsI/1sOzQ2R4FDrYHem0Wh+Y6YZs83EcIDQ9AtPc
	 jxVdGXmfYPX3WuNx1c2XkXSp5JIjYAZgp0SmqA9MhICP0+WxovLD7/hp244XU/pBzU
	 G4POyP8J9a+25lEs3T7WlRYwJ8fdRDyofhMYbN1A=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id B100A4A; Sun, 22 Mar 2026 14:02:49 +0800
X-QQ-mid: xmsmtpt1774159369tv4f26ov6
Message-ID: <tencent_5B265C60A4EE4E6FBD5AA4CD0096A95ECC0A@qq.com>
X-QQ-XMAILINFO: MeukCuWaRbQlhjk3ZBZ13JN/CRh6EqIJXsd+CCra4KITs4vKLD38CjrFmNFHtk
	 rEyUyWapdJYgk0ZiL+9g/fSHRySYVd9MD/c527wkPmnJ96K/uYNkB3z3b2boas+J5FHZtSSdm68n
	 j2Dc0He+rDQCBjkojrDMkyBwmYZvz5kokcF9ii4bUjtudZSK78P4bOl+NdHit4DP+2Hg/h2sV2sN
	 I/9YwWEjQV0gYsi35SkSzsbRRMJwzWj1ZJZ0S5vYA1IXx7t0U52e9ak8qU/o11eNbeF7ZHPIZiht
	 CGQmAvGW/vRbuNB63E2z6fQ2UqwxhF0xMrn0+v/K0Sdpfao3xdt/37ZmXBux+WTT5vUn7MFwXatT
	 QLzZ7zpmQQYtU+m7BpIUPk3aEJ6On/0OljsbrQMuchZCpCzKvGu3Fdveb2dSgXYzza93K1gguM6A
	 dDgXqYr/pdTd1EgKWlJi5T/4pAteBZw+yNUyiOPwfdGgn2kNm/c1z2a6s1rR6VBJbDuPWoZ+Uvt7
	 yH5vu23g0HO+2RfJdAkvQBAKzUD8oHRbxZvCMMXcBiUxOy7d1y73bcr1U5EGsn9UPU/mLF+s7t7s
	 EtWIeCGwtvXFaKSVoS6MvcE/HN+kdqiQiOBMaFiliFuiVcp1/5R83sWqaxY0yf0lqSTO/mwZilO+
	 xSDbzJbSvZ2EXBJAls0zflO6SzWRPOWzPtF5kHVo2BnJ9AqfTl4dxDkBpbUJnrOCpHk6VSARLQeX
	 xB5FPawfNNcusL+dEbtFroAkoSHg7LKIjj0inv8ymxFR90qfS1j7Ftx8nVnSnMaCqbVTm/Gktizm
	 I+vN6KDtGLq/+wHW9IxgWsVxp53TJjOClc/pn6sO7aTGWCIgXl3xvuHLRI36SOE9EGxXc0K7rT6c
	 LPr4B80Q5/wLyH6tJC9IzOB+loy9TTDoafm2TPa612lIecoTXffhfy6xquWETcckhFjqo7lfhkQv
	 Ws05inFEEr/Wujy2oTFXi5zfvbFEpYM4jmIt9XCzReRhe15+uXM5Ju+qug4ItVodPXj8vtRcVkP6
	 z9pjY1mGd83mH9xglJj67vQyAfBMfsHxAYep5GcrNX5tcYHkc0mDGOu1Fuvkodl8+hXcqG083CLb
	 cgn7PY
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Subject: [PATCH v3 0/2] Add Loongson-2K0300 processor support
Date: Sun, 22 Mar 2026 14:02:44 +0800
X-OQ-MSGID: <20260322060246.1375569-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch adds the necessary DT binding documentation,
and the second patch adds the DTS and DTSI files for the SoC
and the board.

Changes in v3:
- Corrected the compatible string in DT bindings from 'loongson,99pi' 
  to 'loongson,ls2k0300-ref' to match the board's formal name.

Changes in v2:
- Split DT bindings and DTS into separate patches to comply with
  upstream requirements.
- Included the missing Documentation/devicetree/bindings/ modification.

Known issues:
1. The clk controller node is correctly defined, but some frequency
   configurations rely on future driver-side fixes.
2. uart0 is currently placed under the root node as the 2K0300
   manual lacks explicit documentation on the bus/interconnect 
   hierarchy (comparable to the bus@10000000 in other 2K SoCs).


wjjsn (2):
  dt-bindings: loongarch: Add Loongson-2K0300
  loongarch: boot: dts: Add Loongson-2K0300 support

 .../bindings/loongarch/loongson.yaml          |  4 +
 arch/loongarch/boot/dts/Makefile              |  2 +-
 .../boot/dts/loongson-2k0300-ref.dts          | 34 +++++++
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 95 +++++++++++++++++++
 4 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

-- 
2.43.0

