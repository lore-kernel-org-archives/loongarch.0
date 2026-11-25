Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795581132;
	b=Y51GAE8XSUlfOrn1QYou1oTgyL14CqCTyRZXlytmRzYagKPE1PJKhIHN5UKQi3CCPI37
	 B6+RSbEEhYv01XNTmYo82iOyrcPdwRP2xklbsFlCRS5QWNotvpO/cVbwN/PMuFP+WYTVv
	 mzY9LcEwmO++vuO9pKce8gnB3mHqHxQ8Q9KuHGiXSxIAFKWRPBe/8gDoptrdFWTudP8Pe
	 vEhyS4vYC7gQRqyhtBwKLG2dQAe+Xnn5wICkmCUFfkNvirt2uTvtuyjwBpOygKvRqzwop
	 xAVKKeXg/QdAvKuFvpz6zGDJjPgJzU31HWO+vMmumCnl0/S1qfYlb/GRPXGJEtl2fBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581132;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=f9gDYNqGTMubLNTDveiMR5pqeWuLfyQ7IVC3sSuyPYw=;
	b=2v45ywAmfwIKdWj2gJ7EmXx7GL1dO1Rx6J7ZUMlL8I0sVn4jLlGCeeOdX+1z2dxa8VUA
	 kK3FbowYQkn5LhybSMqUa+lOoG1+hX2j7k6SASyEcRXFUutcQpHmF03GF8dCLYL+nuUxl
	 dgKUuhShiVQnVREyFGKz9PFCop+tQnQ8Ncs+IYGkd3Eb1lVGdMO6NTsMtClP+C8sE0zai
	 SclrHow0NOB8KSk7Omnd6A1kvxRm6phsKdAUPhisad+bbMTx3YRZD4RB47rVJdUsR0/A0
	 sY9RXtUNENPKlGmXqo7SYC2JflyDR+0LT8zBUbLL8AjGNlZecfCBWWtlkleOlBTzJ3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=hanbings.io;
	spf=pass smtp.mailfrom=hanbings.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.109
Received: from sender5-pp-e109.zoho.com (sender5-pp-e109.zoho.com [165.173.182.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA4A606A31E
	for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 04:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA4A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hanbings.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hanbings.io
ARC-Seal: i=1; a=rsa-sha256; t=1795581118; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LfEKWdZr2dp+wfgYBS6Ul3Om3wt8U8SnxZ/bSL9RADjbZPhjdDsJQ/wKg8+h7GEyICeGrJm6vDJ48MxDVRXwSF7kZ5LmFhilbUqLwqBsyC7etkMm0opveIn7WT3SmkSklF6xdNwl6txCHbYuttJEnujejDz1c6uL0E/ItCuqXo8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795581118; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f9gDYNqGTMubLNTDveiMR5pqeWuLfyQ7IVC3sSuyPYw=; 
	b=UIY7exyG5fHHLqO83LhAS1d0V9jqk4PIz5EANpJw3GdgNcPf1rdOKZnOQUe+SJMPLQJ0I46Cz1V+EGip4ZgPTgpa3TioOYNAmTLaB9ireQZKlmvcTQXqjniE9C7QAdsWsvD/J7uHqFeF5nsyT/tg+jteWyGdr7vy+y7mrRYnQho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=hanbings.io;
	spf=pass  smtp.mailfrom=hanbings@hanbings.io;
	dmarc=pass header.from=<hanbings@hanbings.io>
DKIM-Signature: a=rsa-sha256; b=Cpd4oRpOdy4Mq7ip93whtKLZf5RT297unP93rOZ6ViWs0pv5J4yJRreXkTTtGIrSFQRhJFf/wU33kVd7OidOSR/hfhr0xDn7iQruHAetYIUU98rzG9wWwdr3rS4C8LWvaZ/avEHvzdg/E8vEe9OxhoDV4C15bSU9cERWEICGcus=; c=relaxed/relaxed; s=zmail; d=hanbings.io; v=1; bh=f9gDYNqGTMubLNTDveiMR5pqeWuLfyQ7IVC3sSuyPYw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795581115643986.4662221765097;
	Tue, 24 Nov 2026 20:31:55 -0800 (PST)
From: Xuanlin Chen <hanbings@hanbings.io>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Fix off-by-one in bt_address() exception vector check
Date: Wed, 25 Nov 2026 12:31:52 +0800
Message-ID: <20261125043152.2433689-1-hanbings@hanbings.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b41eac12-ef10-41b4-8731-f057471ee11b@loongson.cn>
References: <20261115193107.571674-1-hanbings@hanbings.io> <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com> <b41eac12-ef10-41b4-8731-f057471ee11b@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Tiezhu,

Thanks for testing on the 3C6000 and for the tags.  I have sent v2 with
my real name in From/Signed-off-by and added your Reviewed-by/Tested-by.

Message-ID: <20261125041514.2431377-1-hanbings@hanbings.io>
https://lore.kernel.org/all/20261125041514.2431377-1-hanbings@hanbings.io/

Thanks,
Xuanlin Chen (hanbings)
