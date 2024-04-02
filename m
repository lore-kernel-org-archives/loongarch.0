Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163C458AB2
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054770; cv=none; b=plw1wpXyPQ9F9AY6azlHWq9+f9BzBP2ReYSZnlggJhZXoO5+uThStC4hDlFv5jS//HYiZ2n+LN8HQbwIQ390KmNA6UXnCmz30OcI1lKkWoAcko7TfEmOqB/g/00OHvJiSbGvq5Bpfj42VNWd9jgb04gXq8CPwORF/w9Y68hJQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054770; c=relaxed/simple;
	bh=BwFIqznhYSYPd8an0Q2AyYq224PV4XlpCYp/tz+LHdU=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=WcekwySxQHqBcDaeyPXzblRvgpG1qCgKFQ6FIGyTBTCleMnPVwvx3QGBcTK8dEv4AcVKVOMjYZHCUmDUqVU2ip5Ogtrsjp4zcxWr8nTxV4dnxGt7C0kHFDBKVg5VPwMX6xmhKL4Of/pwvbXRvNJpeXzSfpMp5y1fBvD3HCCgpdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-FEAT: +ynUkgUhZJkXJ2GkVrAA9ITwCMeqGEJyg7gbtaR1iiaMCqpI6vaifUXdwjFYG
	5U1zWO3XFcFaZ62i3wALBksaW6ZaL1uoFOV0eBC9Y7tpf6+apvRrZ7cES1KFu2PW59/go/k
	WQ8pAOp73PrC5E/iWVNf68gxgIzYAkzuZvoz19mwB+j2ebVefaAzbUGnkTs+b+IQg/rpf2T
	6omaPTc5D/nODZkslWljv/UPRXGjvWYkpDzd3D9dUH7U4r7S1Rgn9LKzhXGxVu7I95HgxWt
	hcaLd3NEE8pG2KklyhD1azaU/MMS/Xy6Z1dQ6t97MvdZ1Q0fFU9XrhNnQpiXhT/ZzHq3Ju4
	hRRGffWAnX+irMmcl4Q4aa+vhAIKMzI5bkzF+9TN2Ef7YNk0sT9BlpX68pPHw==
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: B4F1NIpmc8L+ioATNeMek/eIAECDvCDomBf9TwzzcB8=
X-QQ-STYLE: 
X-QQ-mid: t5gz7a-2t1712054752t2506555
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?WGkgUnVveWFv?=" <xry111@xry111.site>, "=?utf-8?B?emhhb3RpYW5ydWk=?=" <zhaotianrui@loongson.cn>
Cc: "=?utf-8?B?bG9vbmdhcmNo?=" <loongarch@lists.linux.dev>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?546L5pix5Yqb?=" <wangyuli@uniontech.com>, "=?utf-8?B?a3Zt?=" <kvm@vger.kernel.org>
Subject: Re: [PATCH] LoongArch: KVM: Remove useless MODULE macro for MODULE_DEVICE_TABLE
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 2 Apr 2024 10:45:51 +0000
X-Priority: 3
Message-ID: <tencent_411F127936C0F14A261A445E@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20240402103942.20049-1-guanwentao@uniontech.com>
	<453b49801d789523f7366507d1620728315b1097.camel@xry111.site>
In-Reply-To: <453b49801d789523f7366507d1620728315b1097.camel@xry111.site>
X-QQ-ReplyHash: 4178647614
X-BIZMAIL-ID: 486678769786288338
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Tue, 02 Apr 2024 18:45:53 +0800 (CST)
Feedback-ID: t:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

T0ssIGl0IHdpbGwgcmVzZW5kIGluIFBBVENIIFYyLg0KSSBoYXZlIGEgbWlzdGFrZSB0byBu
b3QgYWRkICJfX21heWJlX3VudXNlZCIgaW4gY3B1X2ZlYXR1cmUgc3RydWN0dXJlLg==

