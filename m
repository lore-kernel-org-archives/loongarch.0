Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF301A267
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774158655; cv=none; b=dSZDk483rM3KHOgVS7eXmtk4W/XAFkoRct/uTEzzpJliJODH/VDAXwq25uLW6G9L8c8DGksMfnQi8EiL0osGaO4RZf2pi4NIV64unr9bF61K7nwfAoRwaPzMwM7yqNlaK0ufedvUJj1hJHOJmcMB4ZcUPtyfGACHHBoCrhfTFic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774158655; c=relaxed/simple;
	bh=Jo/d9MGEfjTERSXJqQw65nWSnZxHp6XN0C3cV6FYrCY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=pmD2FEJ9jcwOcczaPkGni8amYhmTkKNk97IDQ5Htp8CeP65CrvPKtZ/p5IX+DfVZm2XLB3yDw3wctOeF/sI6Kmq+M1HZDB46UbaSe5DqlvD7EazKYyX4YbCnjsLIqkmQoVgZahqzK7Ik008zXKVsTc/QmVTepvWnMK301GlzUXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=TNwXuoru; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="TNwXuoru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774158642; bh=bR3qtMR7OXA0X+ybAScHGJpfdXk8YVrMhO2aycGKYhE=;
	h=From:To:Cc:Subject:Date;
	b=TNwXuoruBc6k8YDqv9gjspBljaTWS3rXJMa2C80tFYVfAUAJ5iMExYVymRKYgC5b/
	 BjtPav7YsI7jAn5w94mtf9xlGq8t9aj5WTqMcZNc6kgVTXEe1bqJitt+1Au9VcswS+
	 Cg1hP2o3YDErJWRBQR1C37vJo4WWMG+iywyxsfzE=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id CA83BCED; Sun, 22 Mar 2026 13:50:40 +0800
X-QQ-mid: xmsmtpt1774158640twa83aa5d
Message-ID: <tencent_17AEEAC6ECC585686AE1B4CA6B745A15A006@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uVABu7X+9ighCcCOpg7S3ptfd4hYj2LxXI4yRSRPowOuVDgcoiz
	 rzZ4YeuYl3oxrqSwXj/MkORZO4OZs0GRkucc40GOXkGKLDkJtC3nAAwXBUMmdQmeXGunlOfAeVD6
	 Fpdt3+hocTgYoReB9/RsxjRo1O1DvneTYtMSCFsEf45UxIdAFa3NSZV6JnjVr26HG8sKZGwpLKAC
	 MifX/x/rzDvLg/q+jHkYh0J2CJZ3e8VKxDc4EOnTno9JeDJldNj9NINAn+/GSjuPH8ohutQQh2wk
	 pSvi0A+TkouhJ7RuhCMvgUeZdpWothp90lDWyiSoSyXTXZpGHABdVbjoY230yZQM/b1j5hPUb/gB
	 Les+YxPHt2RUW2pWrSuYHprV7yX1w92wnTnNHTPS0v9fokFBeRztLebigqHlw6Jv45nTdT9SH7dS
	 jRSCWMCgkdnuD9W2oOc8bmOZPxqs+s0jHJo+uS5Twrp7pwVdRFnvzC8GcLM4uttEQankDSp9ZSo8
	 nROnvlAYzIjwddTUE8xK3WMvdrIbsOdRJ5fVfU2Zy4byxfgOxp7vRLIxyFH9Ve14Hp+0CdEzbKa8
	 Q4nH+SW5yNlBzA4JNEMKkT8hk/yBpw72YE5cMRt+MEUuJ3cWJVHPdPuR6N/C6miiPnwWs85yyCLL
	 AVVqgi0mQbU7qLfdsDXB0CgD7tvoCJfOxBCcriUO/wKEIwEO1sy6e7e3fzc2o7EGbickIerGvnKo
	 jbvRSasR9/ETSpZX0wdqsTySxGgUdpQQ2n9vvO5M55+gtsUnmg9Q82vEEBxmZqy22w9D4TLDqAZ2
	 nXeRx/q41YuZtGqLtqkkreTSDGYWwGojgrVfZpKgyk0meWwzialYZ5zk2uPHKmk9b6XfK+TqE2lp
	 8jOPXimT3/SUgJnWGWORjvWnq0v77Z3mhvLqUgQondC13fz3/Mek2AMEXJ/Lmv4PR25TsLPtlzwU
	 FKuVTUSm7mvhCEMGh4HuZO8hnTgnCeP+d1dkA4Im68DHPXZmyymHvE7ZRJI2dyC0stXsMJzSeQT6
	 wUkDcs3BwumMy/0r1K
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
Subject: [PATCH v2 0/2] Add Loongson-2K0300 processor support
Date: Sun, 22 Mar 2026 13:50:35 +0800
X-OQ-MSGID: <20260322055037.1358712-1-wjjsn@qq.com>
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

