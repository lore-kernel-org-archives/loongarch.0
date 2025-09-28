Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605D41D5AC0
	for <loongarch@lists.linux.dev>; Sun, 28 Sep 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759070822; cv=none; b=aqO/92JaoarSg5gOCJuia+dWftyKExDc0DgJXV499LOJe+wa3QlBiwPRQMo42fpEt+qcehxvyZX1Fgwhq4mwQDh/Qsm3eCJMBYGv4nu5U7GyKDgTW6eddTnKXFDONvTZkRWY4y84LbGNs9/pn4G+8la9FAAJkJyXIckCv+mmDFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759070822; c=relaxed/simple;
	bh=5rJFaZEqtB9hHlqrtlG1TXdptnMPUXQg7QGxKkH9R6Y=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=Sv5ZrzGwa6+3PVR+xWu57zaoZnAGENHzEaDawFtzcpsKWCa0N4h9iA/h9GmpM2RzXeeIBkIuULvZbgB0aTkGRzalwD0cNQ13mx2vRg0PUZAJLnKn0EnXmoHsARZiGcgyVWqbMemeo9SlGXzjriCAuEFSIfGStN2E301GSszpHew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jOKyetar; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jOKyetar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1759070798;
	bh=5rJFaZEqtB9hHlqrtlG1TXdptnMPUXQg7QGxKkH9R6Y=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=jOKyetar3J04N9nF3dYvGKalZb1amqK64HSYYOUoT8eSWXsFXTxWaomDF6bmj76tN
	 3mto+Hd8TtXxEzGSb1Hn+hocPL0eCp1qYthrfaYcj8KkXZdLbJj0zq2EMx4Ph6x68x
	 Cd26F1gu3R6Z/MUOx4xY07OmmnLWtUWgpUfcpCfE=
EX-QQ-RecipientCnt: 6
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqT3izQPfYk+lmlkbENMFn3oJT9AK4gN80M=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: ppjhZGxRIbPszfoHJBX1dMvjo0ScqkqEQs9v3CaVWI4=
X-QQ-STYLE: 
X-QQ-mid: lv3sz3a-6t1759070774t86162cf5
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?SHVhY2FpIENoZW4=?=" <chenhuacai@kernel.org>
Cc: "=?utf-8?B?V0FORyBYdWVydWk=?=" <kernel@xen0n.name>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bG9vbmdhcmNo?=" <loongarch@lists.linux.dev>, "=?utf-8?B?5Y2g5L+K?=" <zhanjun@uniontech.com>, "=?utf-8?B?6IGC6K+a?=" <niecheng1@uniontech.com>
Subject: Re: [PATCH] LoongArch: mm: try VMA lock-based page fault handling first
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sun, 28 Sep 2025 22:46:14 +0800
X-Priority: 3
Message-ID: <tencent_0699F58F055D10117355797A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20250925092902.1366058-1-guanwentao@uniontech.com>
	<CAAhV-H5ny_e9G5qRUMYW-d5LqjXv8rvsGMz9BQPt6+npyPmCOA@mail.gmail.com>
In-Reply-To: <CAAhV-H5ny_e9G5qRUMYW-d5LqjXv8rvsGMz9BQPt6+npyPmCOA@mail.gmail.com>
X-QQ-ReplyHash: 4062745095
X-BIZMAIL-ID: 17622792503251770790
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Sun, 28 Sep 2025 22:46:15 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M8JnMGwRo1mQc505/BA61rmjH6EwKSSxnQ6x/bjiO0ikn9F5KM0gDtSs
	/aOBKPkeqEQxalEQ0O9R2lltRHOIWSQnS95tdBpkYb1omV4NTsIU7VFtZ/EkVJpTWBjMM1W
	ocjVYrY/Rdy5gCOaK01b/Mriw2fwkRfXBXmyu5Irc/9z55dlkZKhFki0J7JEIFIhlDtmCqM
	zEhM4joGyRI2wq5yfDyd/5irLwAhhuY3p5iI2fXvsxpD0ma9BsWPzlOmqkYNJI3jdeZkBAh
	qdfQVJWhjRhZibfJoZqUfPPPbmXlcErx6qe/o9WU8n1XlKQMVBmKD1y2KBWH0QOJrA/zhid
	pKTUQBkvaltMnpc2sJLY/gn82KbAbDJi51KGCOCMLnqNBJ99lNJGTkYaImtifhtGDcm4eB8
	RNeo/EkyciIXy25hIEe0LTS+R4ARk7QDMjB011NFPSiSPM0SFkWTF09gMSpjLNwWee+2oK3
	fG9l5QQLvuauqU+nK5MXqjx3aGxzua0s0mkfbWOqM5vbHKwZPNQnUa4XZ/0qDQiIMUg1Wx3
	eaMk2KM52IK5kEEd3zCJUG4x7XaO5S8j39nduWZrXL+2xuuM9X3YT0V+ypYqaQxCsV0HcLc
	RbJqParPXgtcU85yabdOTxV1rDos0AsdA/fFminjoBVl44h0iAPOwntZQf1mkS39+l79F7V
	wTv4woqOAEWGzkTZ1CYVcEJAyI7u4eK9+fAFiEKYOseyCDhkh11VWxacnjfWC16lU8ODw3o
	nBKMZoVKWO6cr0hdsSZ8nSFLGRFTluHPpw93uDK/uOMyyciCxaiewJUUqGHoMvTYtk1Wnkk
	R5T1/l9Gbmq7V0spR6PtkoHftkYzMteiu18VXqehaWCOYW3DDoN8+F0I8aCZgE74Je9zmx3
	MMVlMRqr00oKo4hflwvIX/olhsDyE5eUKgygAAQopc9D+J6h6GSMEnOGX4m3812n9vMzE9v
	HEkYz5ipM7zJSQlvQv60FnZZ8LE6QetelAG4uW8TFy0mCvdwExpJIAddASlpEJxqmzL2JiU
	P93UlIAf+qHLdXWwGmhUGgQZAApRrsuy6Bhar64g==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

SGVsbG8gSHVhY2FpLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCBJIHdpbGwgZml4ZWQg
aW4gVjIuDQoNCj4gPiArICAgICAgIGlmICh3cml0ZSkgew0KPiA+ICsgICAgICAgICAgICAg
ICBmbGFncyB8PSBGQVVMVF9GTEFHX1dSSVRFOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAo
ISh2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdm1hX2VuZF9yZWFkKHZtYSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
c2lfY29kZSA9IFNFR1ZfQUNDRVJSOw0KPiBOZWVkIGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50
KFZNQV9MT0NLX1NVQ0NFU1MpIGhlcmUuDQpPaywgSSBmb3JnZXQgaXQuDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBiYWRfYXJlYV9ub3NlbWFwaG9yZTsNCj4gPiArICAg
ICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAg
ICAgaWYgKCEodm1hLT52bV9mbGFncyAmIFZNX0VYRUMpICYmIGFkZHJlc3MgPT0gZXhjZXB0
aW9uX2VyYShyZWdzKSl7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdm1hX2VuZF9y
ZWFkKHZtYSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2lfY29kZSA9IFNFR1Zf
QUNDRVJSOw0KPiBUaGUgc2FtZS4NCk9rLg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gYmFkX2FyZWFfbm9zZW1hcGhvcmU7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4g
PiArICAgICAgICAgICAgICAgaWYgKCEodm1hLT52bV9mbGFncyAmIChWTV9SRUFEIHwgVk1f
V1JJVEUpKSAmJiBhZGRyZXNzICE9IGV4Y2VwdGlvbl9lcmEocmVncykpew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHZtYV9lbmRfcmVhZCh2bWEpOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHNpX2NvZGUgPSBTRUdWX0FDQ0VSUjsNCj5UaGUgc2FtZS4NCk9rLg0K
DQo+ID4NCj4gPiAgICAgICAgIG1tYXBfcmVhZF91bmxvY2sobW0pOw0KPiA+ICtkb25lOg0K
PiA+IFdlIG5lZWQgZXJyb3IgaGFuZGxpbmcgaGVyZS4NCk9rLg0KDQpCZXN0IFJlZ2FyZHMN
CldlbnRhbyBHdWFu

