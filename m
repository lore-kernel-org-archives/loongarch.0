Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988372631
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774160914; cv=none; b=lAnZnXLgpPp3RP8Q/CD3Dcbl9KQFWQtvBWGTHtW+wc3C9cp2BIEDSRNAjWbTYjXGN+EO2Q/k7Yl41i8oiRsvDtUilqYk511jq7O72i+vM1qfYx1VfEdqO7a4uIzy5zu1LoZhdd+F8oK5Of4KJXzcQH68HsHRzDzVp6OhfGiK8N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774160914; c=relaxed/simple;
	bh=jwWwef3/GtRARkMIGWIVKLs2VnbesHGxDECzc6V62ds=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=osRhfKAloWY5IN9pPyB6ra8FG52nPJm6Mc/FJwVUVFQ7rQl0cZ/cbEp1CcwV9etZBuwhIrWZ96RsVa9+yAxm4STBuCsUv5uCmC5aoeebIsgiMbJECPKzXyIhNtTkAbxJlsFx6QHfskKFjP0lcKhig/4DHIrKlO556swQ7ZQHdsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xUAFBsrA; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xUAFBsrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774160908; bh=+pXfClmsVBNsQyDOV/FiJlV43wBAJh3B0Z3/4SCxtLY=;
	h=From:To:Cc:Subject:Date;
	b=xUAFBsrAz3HRFFZ2y6dbN/TArwSZpq3g8+KLGm3eftzcJ0snVhZrn7KSJmY7rCZ9z
	 NW6tP8cNCUIXFTD49ezGsJOh/qSDBt+LNVKwbSlV52LSkJfcW7Fe+vCP2npBw/X6uV
	 jzLoyojIeS0bjpwyXJOuHJ95omxOlWY2v9UBbVxI=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 7198DAC3; Sun, 22 Mar 2026 14:28:25 +0800
X-QQ-mid: xmsmtpt1774160905tggc4juln
Message-ID: <tencent_1680B0AA6FB3261725A9EBD308AFE1698508@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ1IaXaivgTMXTjlkWhSKz+HgHKOJK8uerpnRURubnH6kPZSdqxT
	 LuT96w4UKT3VV1rreJT9USGj4GhKmBq3LlqsTsllE7qfHCIrHtdDcrePOOBQy+5kIYOdti95A1qp
	 6fCQtJIad0IV1/5WPMclGUjUXuBOL0EGADE7ulLzC5S4BsBbOTENRhlVMQ6GXH+sj36R88BTjeau
	 JO2gVuK7+hRDLCoqjy0E7GkiuXOHkICH+cK91oYJcexwjQyRk/9uNR71viots5Ae4Y2fKBecidMU
	 r1BXrYsZH7HItYLHdc2PSa2+IVKX1diMyz8qIDmh+S9UnneIUcOEKxxgAoOIVmo2dQBIBb5oL1pK
	 wU8rUUkzDxqHakoQCdLbFshuBlGBvCfZ2TkJDuX7OZ7RIinvgFS8RqTUd3ltvWAEZnCBSpyKGKqS
	 FJ9CiBbX86lxWOZvOFRqWAe0NP4gCnHDBGsLsgOI+VIpMWmTY0YfL4jP6xvCVJoLMHM4aJRNK4tn
	 2l7E1I5zpt7ZaaWw53lROO4lFSA+pOviYgZQE2ikW5nahLQsS3Q/UfGBvgYY3h0ZSFKhJHqXLXI8
	 3gwli5HhbBepYfY2kz0veZ/eeLpfBcts/MIysYs4Mi+bFm4C6bUQWWVWgnVc0bSLP6AfJBeIfR0J
	 jnPb70RCvCk2vR832EFb4z44+ShBnTz2Q9sXh0pH0lTIWmL9f56/I9S+Uzdsj5cRzksxVuVntnvZ
	 rhTY9wNqjFJY8Y2QtwbfyylelVZXbI6T5WzmNr/C9FSzeUzJd44K+mzb4USsrNzclQDSW9yWAhGZ
	 49mjdCMTBWnl6N4R6DoT9g4Xrac8nfuJTZaDaoDocvgTqHPTCwhogaGf53GBVt1FxKpGtCfLg5Td
	 IAgTIDDExDgoAVpuzN1XGNGTG8t9gtBQFwLl6+6ZlP+xDY6nvMmvgp/HNH5dOZrFU3TUv4OQlT+b
	 0/8u0z0U0uKb/BfqlINR7nM41A7bQUb4AzMJ+aGd4SKvO50us8nk6ZtxdcMM6HvzHCwo2FsdjR32
	 d5Uo8zsqtfwRh9GuuTsV73IClPWbvhKgLecJhPARYfFXP6ExUzJuu5n0M7NkI4/xIGqm2sUnWyWl
	 FeaYHBnd6BSFGnNVE=
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
Subject: [PATCH v4 0/2] Add Loongson-2K0300 processor support
Date: Sun, 22 Mar 2026 14:28:21 +0800
X-OQ-MSGID: <20260322062823.1413724-1-wjjsn@qq.com>
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

Changes in v4:
- Fix a typo in v3 dt-bindings where 'loongson,99pi' was 
  incorrectly used instead of 'loongson,ls2k0300-ref'.

Changes in v3:
- Corrected the compatible string in DT bindings from 'loongson,99pi' 
  to 'loongson,ls2k0300-ref' to match the board's formal name.

Changes in v2:
- Add DT bindings.
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

