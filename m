Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=31.44.14.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710177;
	b=0XPiL0NC5kl8AABnIc6l1J0BrCKwE57mTEKs89ocECbkrgOHXnoooeh/gOJ7xg95SMeJ
	 rwnITxOLgxe8kP7fWaDhdyvRc3mztw8vOqgt0//bvi9jIeed+KTenvYmbFUPsMo64I08j
	 G3QKoyYQngvu+dtm460otFsn3aHZwSA871z/8lNbSqrhnhFtq3HiEQ8IeciSvZ595Q09S
	 9b/DsAVMS/CN3mJH/MVhwXxKOmTuKL6U1FLTa78d1WyPtJpyzWWYKi0O9q9kj16lJ93aJ
	 xAUtWyiCm8++7c5hspeBs6sNCpvYv2OWprxbOCG4U9eECcOa/IvT0pfed7GCfsfU5Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710177;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3aq52ZUgkKncJ05m23YNyeHOXWc4ZrL5cEeAjd1MPgk=;
	b=ZAv5HRhgK4JzuR21b1x1uv2KyPapr5GtUZDjWYziR5r7TtxTpD6EKI5uHXAA48JePP7m
	 iZZmhSPEae0iHvVlW0QOz18pGwamD4lWTQ6Ng8KdEjo3NHJYuAYgvS0K/++6+0YPVZSq6
	 72pIfmBa8KXITOOUyu6OZ27InhBqH+q9PIuon6Kv6MmS8vVeLQZFnJ16H+zVP0m78Avdv
	 NTCQT72RwkuSZzZziTl3wO6VgCSDuELy4jRd3d923z7hKCQV3qIIJOA5z1DeRokv8OGuT
	 6hB82BU6mXbw9S0/fzI5DRzDRXnRzdSRN3oALW1CxZ95cg0X7OlE81IxsTlZt7Mm+PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=S1ykVrg8;
	arc=none smtp.remote-ip=31.44.14.19
Received: from forward503d.mail.yandex.net (forward503d.mail.yandex.net [31.44.14.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01875606A31E
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 16:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01875606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=S1ykVrg8
Received: from mail-nwsmtp-smtp-production-main-66 (unknown)
	by forward503d.mail.yandex.net (postfix) with ESMTPS id 17E00100046;
	Thu, 26 Nov 2026 19:22:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-66 with ESMTPSA id fMl6Y9SXmW20-8Ch6hsFu;
	Thu, 26 Nov 2026 19:22:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795710165; bh=3aq52ZUgkKncJ05m23YNyeHOXWc4ZrL5cEeAjd1MPgk=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=S1ykVrg8dntA8pp2GoVbPJTsywofdN1+kJuY5RyoAWPzQUQaPsK15qcL0Q+l+MaSz
	 GZWe/1zIG/ZqEAV2yJjximanMVIPjg7o5QTi16Pyq7+J5dZ/okXm96IlC3pxqg7ble
	 Zd9ap1h1D4eW+hgSWkx3TlavlRj5+xTYt87uspdw=
Authentication-Results: mail-nwsmtp-smtp-production-main-66; dkim=pass header.i=@yandex.ru
Message-ID: <f2591cc9-563d-46c0-a83b-de763ed74e07@yandex.ru>
Date: Thu, 26 Nov 2026 19:22:41 +0300
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] efi/libstub: Provide library helpers only where
 needed
To: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
References: <20261126155017.2401147-5-ardb+git@google.com>
 <20261126155017.2401147-8-ardb+git@google.com>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <20261126155017.2401147-8-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 6:50 PM, Ard Biesheuvel wrote:

> - the clz/ctz helper is needed on all RISC-V

IIUC Zbb-capable cores has native clz/ctz, isn't it?

Dmitry
