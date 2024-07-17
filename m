Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62A7494
	for <loongarch@lists.linux.dev>; Wed, 17 Jul 2024 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721192297; cv=none; b=DRDUVNL7oD1I4xefWGNUlbO0Mj+0HJF254G+2atwf7nHJ9iqV5v2ntpF957r85Ijz83TgenOkujZ3OjPy6quZlchZ4idvoEPVv4xRIlhNq+AQfe7qbO0oZKvSxh5BlvBuSrQT1GM6R1guPnWdEzOgjb8HNWop59Bf1ex/sfvYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721192297; c=relaxed/simple;
	bh=vABRMnRmbUscNHZGwHRUTWrzrPZYmjEVucxlkyKGsgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Azbf0rdu5DEOAZpUSnhsdb4skk806a8G1eTnoVERPXBU5KJGaj7z3Uz7vqP4xB5o41LdXdq6Scl9rNRSh8cqteHpVHazTzVEV84kIfyrRcPBwyOZOzT9BH8QYbUYjBAIKUaBKP2yytT04Uf/Pp3Fvc6wIyzWfKORzgW+9YqClJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cDSMXZyf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cDSMXZyf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso7715999a12.2
        for <loongarch@lists.linux.dev>; Tue, 16 Jul 2024 21:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721192293; x=1721797093; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EAXDs4QhymT5qdSIqwghPBIT7eGCMQME0KsEWD+9hyo=;
        b=cDSMXZyfrXsFEHc5TVv1WbakECp7mu91OwIjN2v8QMFHpU6cGqXpx6treqNlI1kvRd
         l8+ftvyXgVVzy8U+bT4etUVnPwHMSAr0duiEuXmKa7Zk5fh5uJBEBpEkyIdTf8r2sInJ
         DVP2EDaNofs1GY7lqPqT3a/ZnSI2dYE5pZ3Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721192293; x=1721797093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAXDs4QhymT5qdSIqwghPBIT7eGCMQME0KsEWD+9hyo=;
        b=YLuKa+e6qETBuT9bwxOBdbNVYTr8qIv/fbKrC/YRpeMYDkn/+NmysvaFMKRzTdftK+
         1BgCcUCgJsWaaKH3ISnhU4qnPd7KEd0fTBrgkfy+9IGBylMbSgFybJUedVOWRenCY1J2
         eONX2l3/4LFURGu2/mWPVT24hA3eBIEjgNV1FNQsOR1TYbrfAUstms8iWrb/7Am9xCqi
         SOEwG01IQHZkou2nijYoatEM/uykST7Ncd67UyjMk78Bt94sdkO7U3ObBavDRml9uLSo
         1mFSWX13pXMafEZhJAVSHXfQewvsmqV2x1pFkAzp9ykr4ED3K9y0K/Wiwoc/oIutZf+a
         esTg==
X-Forwarded-Encrypted: i=1; AJvYcCWlovCpbSTfvvFew6JkxJw8cg8I/jX+D6xRbIH5o7Y+zm9lW5YDxlW5xF/oGqZppK2uPa5mrSDWCJtfLWJ9slUxpqbED2DjOsPo
X-Gm-Message-State: AOJu0YzY8nOfFkSqfPNmgrl4AlBWaXGLqOyAIKyQ+xXDQEfFmsauVdC5
	evJ2Cy8MS2MRHOarbGJM6JrkuJckmIg09XoODycAXiDIWy6msl+qfVmcqTKY3ge9CUkEWMFCA9W
	ot6tgQA==
X-Google-Smtp-Source: AGHT+IGQ4UKgvEuChE8wGw80jiyYXUd+N2kWV9Zjk7Q4qB1Cd5uRu5PNQdiyUXB9V1GX8LcDnBJ7BQ==
X-Received: by 2002:a50:99d0:0:b0:587:2dd0:93ec with SMTP id 4fb4d7f45d1cf-5a05cd1b08amr452306a12.30.1721192293514;
        Tue, 16 Jul 2024 21:58:13 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24a770c3sm6168419a12.20.2024.07.16.21.58.12
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 21:58:12 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so1559888a12.3
        for <loongarch@lists.linux.dev>; Tue, 16 Jul 2024 21:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMvwb0182vgoWgJ3UNDGNX4hlSdL2/eNuR+Qye8bpGFUlqhHENKUIWZFl7TuHQtDzkIW+cFlKZ7mY6U4L2n/W6LCDivQV0p8j7
X-Received: by 2002:a05:6402:5244:b0:57d:4d7:4c06 with SMTP id
 4fb4d7f45d1cf-5a05b7ee599mr504374a12.13.1721192292251; Tue, 16 Jul 2024
 21:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com> <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
In-Reply-To: <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 21:57:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
Message-ID: <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
Subject: Re: [GIT PULL] asm-generic updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 21:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> I don't see those either (this is an x86 defconfig example):

Note, it really might be just 'allmodconfig'. We've had things that
depend on config entries in the past, eg the whole
CONFIG_HEADERS_INSTALL etc could affect things.

And yes, I build everything in the source tree, so $(obj) is $(src). I
find the whole "separate object tree" model incomprehensible, and
think it's a result of people using CVS or something like that where
having multiple source trees is hard.

              Linus
