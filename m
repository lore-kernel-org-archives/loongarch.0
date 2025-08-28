Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81AE27B344
	for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363453; cv=none; b=uTumCuzJuuhAk78gkiEiupcSk6+WFpFz74CEh5nePNk4FktyESwIKL2421BKAAl8l3NrvaLdaVmrFgUYVLl5gb6acZc0ztMYgRay4NDoZnIE8iwelio8wnwmIntBG684jFNxHn7kxLaiiaQoLe3b14A3ddtnIizRD97xm9Iet6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363453; c=relaxed/simple;
	bh=yq+wFxTVL2RzNrDhMgTRNWbOLvZn/ja6zdG986j2M0o=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=Lc7Im/KJZoUrqXL3p32Fa5CYp88PmmU0Q3mOVk8cy9BHuawhCu/P1Ddlnn1v3S9WGefzAn9IfxN/fAxtQzXU3nuK+kr3Ypz6oi4XmqaO3szp1d6s/5yWt/GBYGspcWZtpIFE6Xpn+L3OHQ4swbQmoCN6DHZGB14lYhvgR/iQBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=mTB0tG91; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="mTB0tG91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1756363421;
	bh=yq+wFxTVL2RzNrDhMgTRNWbOLvZn/ja6zdG986j2M0o=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=mTB0tG91oi9x6KssE9MJNelVl8qL7ewICkIoWd+/EEbnG1uXMm7WU4tqqkSVuz+mV
	 aA4os/b/a7ZlJLSCq6jbVL5r4ER6uIDI/2DwOQ4E92Ip6Ym2icFq/uEcVFaPNkU93f
	 EWCopLaqvXmJ5tIbfEFbh6be/kngqcoWYNJRNlpg=
EX-QQ-RecipientCnt: 7
X-QQ-GoodBg: 1
X-QQ-SSF: 00410000000000F0
X-QQ-FEAT: DTni/y8B87/aZgC8Xs1Z47pSOeTS/TBOLVi5xJ6UuD4=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: DBZElzaigNA6Te8v8pMdV02wWLWlM/95ZhXvOU1s/LA=
X-QQ-STYLE: 
X-QQ-mid: lv3sz3a-6t1756363417t4ae72586
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?SHVhY2FpIENoZW4=?=" <chenhuacai@kernel.org>, "=?utf-8?B?WWFudGVuZyBTaQ==?=" <si.yanteng@linux.dev>
Cc: "=?utf-8?B?V0FORyBYdWVydWk=?=" <kernel@xen0n.name>, "=?utf-8?B?WGkgUnVveWFv?=" <xry111@xry111.site>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bG9vbmdhcmNo?=" <loongarch@lists.linux.dev>, "=?utf-8?B?5Y2g5L+K?=" <zhanjun@uniontech.com>
Subject: Re: [PATCH] Loongarch: entry: fix syscall_get_arguments() VS no-bultin-memcpy
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 28 Aug 2025 14:43:36 +0800
X-Priority: 3
Message-ID: <tencent_1B5F03836C31C9BB345806A2@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20250826113225.406238-1-guanwentao@uniontech.com>
	<a0e11216-71b0-447f-beab-351d024810fb@linux.dev>
	<CAAhV-H7zKLNpx7jM=JBT7unqQ=G4Ztv4RgEhrFsjP+P4LjPYjA@mail.gmail.com>
In-Reply-To: <CAAhV-H7zKLNpx7jM=JBT7unqQ=G4Ztv4RgEhrFsjP+P4LjPYjA@mail.gmail.com>
X-QQ-ReplyHash: 3799560694
X-BIZMAIL-ID: 12075257076705248846
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 28 Aug 2025 14:43:38 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NAtipnnbTPea9vulzRXGw+KxxkO2e9FUsEUC7iZkrOcU/iUgF1SuBCRJ
	kWKQ10yMfnR+4ZPpCxXUcGvQePUMPrE82+SzNHE2+9tlT/waWh+X4zKivuaZ2MAWPoVSPgT
	/PH+4434VMD+dk8v1zkSIXS6UMK0hM4IR5VKCB2+kFmzHjJYcje5WiJbxogN0XLVD3n+ydk
	crXtUAMbEIj4UHXn6K5dRl7CV46Xy4RUgqNApTPM2KGu3zvglyArj4fjPRm5dgT+/hW5Xu8
	hmEsOSco3Vr+IYxfdRBsie7BJwB8dDG+v9mXkyDHGxpg7RHeSmdblEZXg0X7A8cqS6Mwf9h
	0jyaa7zJTIO71+b8WIxPSlQkT8rQ9IWkOs5k6dx7ntdZqrUdO8Uz4tvHhP2ZQdnyU/a44ku
	mug9UrA+23uSgdsUuWce80m6pWODxRJWciqFuIKPwEUWc7p4Z6QxMUbjYgV6cmCIxUVRxEY
	lcV+I7uop8zsFGCtgwy1mv7m7YKwY++GFmCBj5Ig59L0nAyqq+yOmBUMI9LHlDLAnP0oxHs
	qSzNgo0fPy4C8jJ2Cb5mgRufjh2p9KRXqZ0vhekbsmGOtWnDWGnF0GXPV72qIf56wJuIl90
	TfQJsxq3k5lBF22Q0rrgyyBV1rQ5YSs3ndJ9A6VUanOtBZhq/gJOYWVI95ofCofEm2JDMIL
	BjChD3iKqtOrptZOSJLusv+DyR9xhJrOS1m1JOmj8DrfGYZ2w1xeB/EVaZOHC6PPq4oR/rA
	qd1Zbr/yQkCTLMmerctwH7LM7U2Z0gW3G4c+ow81DdvqmusyHD6kG/ZXLWJhxOQU0fSzTQU
	7rc2suN9eYogquvq507hM9BkZLcg0lj7pDPBX1KQ844tCNNRoeSNVaMDyXKaYYArMSuBIFv
	dAPLwiTT315GgUor45F99Baws4lvEZIkL4sH/VOVrpC9at9UOF9rOZPdxULW9gfoRVrwzQn
	QpYl+r5/5Vo0TjtJQuvACNbbJ2Ik5etGc31ljvHPD7vZkPgNFjzfCKTRTbVz6lzCw9VeVHz
	IQ+ozp3HVpNXT4GCqA+1a+m9gsRs+pflO1vOOLLSNgvwt77F/upPvCH6zVc98=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

RGVhciBIdWFjYWksDQoNCkVtbW0sIGxldCBjaGFuZ2UgdGhlIHRpdGxlIGZpeCB0byBvcHRp
bWl6ZS4uLg0KDQpCUnMNCldlbnRhbyBHdWFu

