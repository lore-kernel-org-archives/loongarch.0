Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248713;
	b=00PEPN7I9XLDzaBegoHlhusCR6YmDtKOWm9uwtgW5ymwFHHcRT5vjSpKe+iea034hzjZ
	 9JUgyFXgoPOg0oB9lo2zdAzB6EXCk0SK/d+/nrT3tSMRSejXJRshpW2laKnI+38ahV0Ul
	 BjNtHP7NgNQvasJPZc8Ffn8q8ik/eSNkDjbgSTl2gDYbJNNYnMx8XJ1NxZl+T1Sn9X1zE
	 PJU2mZanxTZO73HJjDBdeTAtWmOEs+wNOK69vbiKfkLmzbNRX/3s5EWWYJjGnrMGVlAto
	 Qm4mDCbxLKndg2LbE5fYNMBIK8omZkMgWkXXAiitK7L8xm1TQw634kivJP222AWkpGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=y4Cmesc6c6L7Z5O7qy6m8HiVqUJHOjQyHRE0+sJjwZY=;
	b=s2sRTr2J4BCpPPMQAOR4EvmtjFqgNKJihelKzbRLE3kS0tK3rSZt1BVDQ1+co7C+ul0V
	 uf7lkXe1RfOD2OVVTBhoJ9oPH/J5ycaivBh8KbB39zlS3DshAjy1VmfTxflZL387ouRpI
	 mCqXi4ZqReuUQpIsDCCg9SWXqx+ue2Yqxcpns27QK4/elzME1GtU18nwVVcP0ubbkWav2
	 B8IrjvwOvCPfFyo8lQyHrNxa/EAN9zVokW9ABqnbf4Biz75KVBQiAO6p6QDdPJEJrMUch
	 open5EmnCyaxsvNd/4ELx4wfcQNh6f9kqB3Q2bbEijVYelmEAy3Qu9mScyAagOv/Tiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGjkS+9A;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B359606A325
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 18:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B359606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGjkS+9A
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso538879b3a.0
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248713; x=1794853513; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4Cmesc6c6L7Z5O7qy6m8HiVqUJHOjQyHRE0+sJjwZY=;
        b=lGjkS+9A7rxGOPcXilJv/TLthBJ+/OveUhRydoWIOnWIM3e2XHYSMijB5b1mhehhzn
         tlJN2lXwiFgk2lP0trrtwFask0KqlrxOAy6bMJIz2/6xv5Uo7lRy8Kdju0yv5N6o7xxn
         7uQIbZ1B8qWCdnVjD6BS/qLXhi+g2cTqCS05NPXSJQQVDPfQ3DH+fDKt/MtmmX26qpwN
         CEM0KcVsaogy16wwOdGmQhTB3qENeI8QPp5/gUzqPPOGHUe7mYQUw45q7qQFVjPOslCt
         AoK2ChQlaYSvKdfyPbcknIqQ+U5phKkzP6QUx79pOKlxIo2a6pXqDF0eqzprnh1rj6o9
         BSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248713; x=1794853513;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4Cmesc6c6L7Z5O7qy6m8HiVqUJHOjQyHRE0+sJjwZY=;
        b=GfvrrBStomXWejCuF9h2ljATltl9h49LC3Q7TFM7Y+QeUoyjlFsGrjjep0hhJNnltH
         YUVHohrIvIuVfOnz83kNfFgsD9ef7LAssQ/vePkM00BFZl8aKmkBnfS0oaN67Ecx6nUj
         pDs96sVdk77Gs+69DKB60cabx46saG72dqPafyO4tfpqZFvxYcKGm8S6MNW4wqSffVss
         kcBEnrCzRPnuTXF3TsXC4ipxheNyEKP2xZQVZKervYkjP81OPRWXTFTNOzXYnUp4F3B2
         c/0oojvBeNNzEBtn5Omj67ItlEoAJI2wy7O2Pa+6ygpTd20NYN/vpdBCSa5wogz2oI3C
         YmSA==
X-Forwarded-Encrypted: i=1; AL+hErGYmQUpQcolLMClaoH/7fN7zQTzrZRVwlYQaKx1Xudsu8s0S/6RISEyUmX6UWSBkQ+V7dJhgei7LXE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8W3G2HcHgkeRN+2MDIxlys1afHGVogJB0uM/s1thNoYcITDBXl
	WEN8YBhz04yM9Cdfxkweya/OUB+xFG5h8o6a5PF2jFhvjx76bUZRo7i5
X-Gm-Gg: AYBFou1ax7lP72qP1FpJN6/djrsQlpqbIasRVo7nhBqVtUq3yN7mrw0Em3gBHRsQKvs
	++fl52uNgckPiVMoU/6kb3ZEVcMgahB3CTVK7Pf0IduKPHgCo2RLD3yBzgpkfq8XTUiFo0E9he9
	vltCBgpvAdY9i/OrPmWAuoXGjHnTH4HcbMlmQ19KTVMYmMV+V3uoKMP5truzKTGUIdt3U0xiOfU
	t5VimjIxJ1PrElU3fAE+qvULTGqNgoERMdyupgfK4/9EKN/T28a9fz+fKqFUr1i3usziLBy1npu
	hWJVDBb7f0XRXFehpp36sTQbnu7aYy34aIxOz/xfUPHruI8tSeSsyZMS4Wq5pIR0DvGVLb8Qj7V
	FztK3ZuDsiORzBKeCukc3yV59T5CXu3xfmOZHtvWyjyVBoNzVfmWyhc1qH5upNF4zGnaJ0Fk6Ip
	REc9oivk1QT/A/Z0cUFatt9d8xQggnWDvtldnE4Ly9s+nC745JpmI8Nssnf04RsRbTqVpoCZcin
	zmi9Bz2YxgMRJY3DnMnoMiG3nPYxcXcAJ70vvJgDTysJCZ5f3LgOIJ+isUxlowOSGX7PSU2j+6O
	e1YGnfNUj/ly/La3lGRGYJuw/a94NJPP7oeIG35S3kbNPpbys0hnUbGi0Hs0cUp/SMERyswgiWn
	wMcks9QPGQee7dpwSKw+gIpp9LjyufDu1SGA=
X-Received: by 2002:a17:90b:4a46:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b167931c23mr197925a91.16.1794248712676;
        Mon, 09 Nov 2026 10:25:12 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d4e49sm436923a91.8.2026.11.09.10.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:25:11 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 18:25:11 +0000
Message-Id: <DMQW32TTNOPX.24GN6Q7VI6QJR@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Harry Yoo" <harry@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Hao Li" <hao.li@linux.dev>, "Christoph
 Lameter" <cl@gentwo.org>, "David Rientjes" <rientjes@google.com>, "Roman
 Gushchin" <roman.gushchin@linux.dev>
Cc: <linux-mm@kvack.org>, <loongarch@lists.linux.dev>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mm/slub: Genericize x86-specific cmpxchg16b comment
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261109035906.10857-1-yangtiezhu@loongson.cn>
References: <20261109035906.10857-1-yangtiezhu@loongson.cn>
Content-Transfer-Encoding: 8bit
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 08, 2026 at 07:59 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> atomic primitive is satisfied by different hardware implementations:
> (1) arm64: satisfies it via LSE atomics ('casp' instruction)
[...]
> Update the comment to "double-width atomic cmpxchg", which provides the
> following advantages:
> (1) Accurately describes the cross-platform hardware invariant.

You ignored Hao's point about shorter commit logs.

I dropped all of your pending patches.

pw-bot: cr
