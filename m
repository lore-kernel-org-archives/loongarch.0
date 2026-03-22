Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C421A6823
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774163681; cv=none; b=tcRWSUS0l1oZUsbtaHKa7OzHP+ochu1u8/oecrqiBZH0lU84maGEISQeZrpgRI1fFJCJrB5K8zXJOKgDn6/wSKDtMpOggs8XEWpyeTOcDDZIWBLLKefjFYF2mMrnrwXXVLC0g5PQB3Jt0QtRyFgQ7jRs7XtSPUybW8vxSZQmmU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774163681; c=relaxed/simple;
	bh=9Oh7o4s5u3tM46vTj5o9FDWnEPZvNAa6zB1uoaXoc0s=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=MrIP/xnrlX4iYl7jof+V3hazVgoCnrNg6aDVfdtQW1qA1lxWCWUtdaDlj9jN2uuy9ikAy4nYLm4dWpIti07pgJb4rDhrgGiyqa7kWjQlTf78R+e36Nuv4zR1QVIGTcWJPl77UDzcuCredgc8K27Bqs14z+wujQdtnwVupe/OAL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=disre1Ft; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="disre1Ft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774163675; bh=guhDS6bPNI6x9tvBV1aacc+eiiwRreuOKVAX6VU/UZA=;
	h=From:To:Cc:Subject:Date;
	b=disre1FtXIhbuCBn52Ox3ecHQNPbKEvN2076zmDzrLQy+AjWeaRocuj1bkI7FVK3N
	 BXSpuUMGdyLAqo3+AwdeL/jirYRwGLMZZTeRoW7c9y5hxKUz/xMRhgd733sHe2kj72
	 +O+iV5v6mu8jHhRK2xF/RuQ7W2+8KIZ01AfpyumI=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3A0B863C; Sun, 22 Mar 2026 15:14:32 +0800
X-QQ-mid: xmsmtpt1774163672trw816mi1
Message-ID: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
X-QQ-XMAILINFO: N0fQvfW76Vv1rImnb7vbXwpv1R++wOO/jJUzYlvON50oM7il2p9N1V/f9Ft3pm
	 zt1VNdi++gpLJuVZUXV1J/1KscBMva/8WbVS8D+Lrq0h7UHEwpP3rucw/aQ0qr+FLsZhV5QPJ327
	 xYUwuA3hETebH9yjxloBPwrr6ewelwCoTCotzGNrxUs2PerCiALqnQTqs2B70IGzSTmQhG/TB406
	 Fx4S1akdmPcwCuMnweMlCxM8rmgNC+307gKSN910f531mVRiXJ7KhOnLtjQzyXiOa037vbtjunZX
	 iQ8TttLJ/uRD2R9DWeefW5F52QV6OTS+d/SNO0CQYCLg/Jk2fdO07kD6ZbqhtAqjigolYf6pfWba
	 KH+jqhv6onmd5B0z8PSj4/4QZipNsS8tA35AU5JxTkcfkBLDvaoLu+Gii89Pkv5rxT3GYxNOIb+J
	 y/tkfMtThOCYSc5NMX9Crs7t2pM8IIEkbYBGC+gIuu1VPj/ozWtqFrvOHKP5EfdpvxDcEBjyQEJD
	 sOm3lFGrkrHgSvjqsXVV9/lG1B7OMzYsce+Zb/xEyOluRGY5ZboykbxPNyziY62xTzqC2xEZPrtc
	 DSEBFQmF+MlxOcTzyCweDazURSNeUJJv3inOdXIJDZ+xYU2fE6JHtXMhLBU69HUONXuqXXa+0mL0
	 CF4/PBFxDvsHVejK24O9JjTjPb6DoN07VKA6bep8hICGE9HwgUX9OmvnckNAXjinxzMFx1JmZIxO
	 rmV06UyOSb3kwaihpncR3eZoMRlB1yxOylPPyJ8i6y2JkRxYADgXwe77PNuW19mRnhIT5SsnTVsB
	 WYmC0N+UF5abaBj041NIn+uwUdc7IP5+2BtnLXvJDem4gA5awWXCuv8QyhFbNQH7hV5uhIImVUBP
	 MAJ7xmwyq4IlvmIPDQCxUCbUdVyaP82glnuD6WcNIpVJiOaXvW96VvOZtdztx1KhTABVZNvXDZDn
	 kvDqwZEda/nUABrzeqpiyY/sOLg/xo8FYW0gR+D8/vV5/JZP4J2e8hEgxl80CcLMq9FkpFQIQJ09
	 8b7hm+poCPBOR6VpJu6megXcMROYXRWOeGYaxweiX+n4ovMYXXn6ALswquJKw=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
Subject: [PATCH v5 0/2] Add Loongson-2K0300 processor support
Date: Sun, 22 Mar 2026 15:13:14 +0800
X-OQ-MSGID: <20260322071316.1537953-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wjjsn <2858482031@qq.com>

The first patch adds the necessary DT binding documentation,
and the second patch adds the DTS and DTSI files for the SoC
and the board.

Changes in v5:
- Remove unneed properties clock-names in node clk

Changes in v4:
- Fix a typo in v3 dt-bindings where 'loongson,99pi' was 
  incorrectly used instead of 'loongson,ls2k0300-ref'.

Changes in v3:
- Corrected the compatible string in DT bindings from 'loongson,99pi' 
  to 'loongson,ls2k0300-ref' to match the board's formal name.

Changes in v2:
- Add DT bindings.
- Included the missing Documentation/devicetree/bindings/ modification.

wjjsn (2):
  dt-bindings: loongarch: Add Loongson-2K0300
  loongarch: boot: dts: Add Loongson-2K0300 support

 .../bindings/loongarch/loongson.yaml          |  4 +
 arch/loongarch/boot/dts/Makefile              |  2 +-
 .../boot/dts/loongson-2k0300-ref.dts          | 34 +++++++
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 94 +++++++++++++++++++
 4 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

-- 
2.43.0

