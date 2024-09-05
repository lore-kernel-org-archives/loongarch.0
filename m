Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A88F54
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 04:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509069; cv=none; b=KbF1ZqvRZit4hsCqcwxROnbgFo8Nne9uzlNg1bFQIyGhf3+hxf1WJuZHsjNfej9iczcM7WfCsZowIGamyJQxuI4MxaUFwrpScTPzPovLh4s0rJwqizPvwyMQABOm2YMofZmmlZV0T+JW/5buGdHFS8MHND78RXfiNu3EfJHyyC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509069; c=relaxed/simple;
	bh=9ZB0L6AWt7O9GuRKjd5K56lW5NclLlgV1CnS7q2mFX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV8ydQgj+zcur9d2BCpKpbL3V4r6tATrEgd8hOV9cAIOegaQ/AuOAWXOSoLU2limWnoWeHWd9BtMXntY60dIQfLAb2+jFOGUiA2bkZmL+fpPhWT+lFjCVKF0hr1ksk1ESO0wLy8xKdmKvLNeI1q9Ynr+v7esgiE6eFQIURMky8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=TF+gB9r1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TF+gB9r1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D509DC4CEC7
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 04:04:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TF+gB9r1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725509066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZB0L6AWt7O9GuRKjd5K56lW5NclLlgV1CnS7q2mFX0=;
	b=TF+gB9r115jyMpsXVMSXC5wqInJva1W2AiKsVWea+6lovbwX1NSXjBj8uxLd1qIoiMht+9
	2Xj3paLzXgYXOPAVa/cpnmu/xndS/s8H2GbqwgwB/PQb8UETLR1pJDrWulcjNEV43hhzXx
	ODUSKn5RptXjPvgK6jr02D+fKgCzFgs=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5de68b6c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <loongarch@lists.linux.dev>;
	Thu, 5 Sep 2024 04:04:25 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-277df202ca9so236516fac.0
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 21:04:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPXrmBFduC/C3QEt7f3+imHJTB7mJCkfzgnwWIjK39qu68/IP39N4cbmi9I/6tmFKWLe+YkP/j+DU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVO3uGPyiWElGFWmVscR1KPt7bH0YkCo5I/ORSC010xwZZ/LvL
	7rw2EzGnyLClM/JdIwPaE1KlsMEHi+SWrXgTPC2A61h513xfclnDuZ5jy+pmaMJTeNf3jqiSqCQ
	2pHuV88HvIcfA85r7GJjmUDtIj/A=
X-Google-Smtp-Source: AGHT+IH0uCXUX5MCw6rQIPaEcR+5fLGNzoZXnn2ucPF8FOINUA4RpYGLiwuWhv8QOKXb/m9D5ymBA6tEsLCzP5Bc23s=
X-Received: by 2002:a05:6870:a925:b0:260:e713:ae8b with SMTP id
 586e51a60fabf-2779010da2dmr24968052fac.20.1725509064626; Wed, 04 Sep 2024
 21:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn> <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
In-Reply-To: <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Sep 2024 06:04:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
Message-ID: <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
Subject: Re: qemu direct kernel boot on LoongArch
To: maobibo <maobibo@loongson.cn>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	loongarch@lists.linux.dev, qemu-devel@nongnu.org, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:45=E2=80=AFAM maobibo <maobibo@loongson.cn> wrote:
>
> Jason,
>
> With the latest qemu 9.1 version, elf format booting is supported.

Thanks, I just figured this out too, about 4 minutes ago. Excellent.
And the 1G minimum ram limit is gone too.

Now working on how to trigger resets.

Jason
