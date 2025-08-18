Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC430DEAA
	for <loongarch@lists.linux.dev>; Mon, 18 Aug 2025 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509931; cv=none; b=Ypb573WDcq7HeBqEQnWo/UMbIk/KehDxHyK/QrLmEdqsZ/ulpGQ1o/hvNSO5HkMHecxmV0elj0tEgneIGLaaBvpg5qlnjnbqqv27HTsiY8bicPak1+GpQcWkhkP7Dko92EfZkFFmpym3WGrRAt/DZnj9RkU2l5AjzkKv1cNVCeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509931; c=relaxed/simple;
	bh=NdEYA7o1VzPQoYIPoKPNZkexWdwuehcnlbt0D0zOaP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pN9uh9OkZXTKiHENxLhypwVyhdKansBgA4ePg363UHFYbGrsuFOTW7J+63kHmdHf52DCR+AFtORD7cOGV773OVP0DOQWChBMfgyS0RaaVJ/qM6dPhFYXlheGVAuMJlDAm3tTwY+8dPO5Nta/UhYC7R2YVCBifHmttciQa/zEZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTb9m79L; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTb9m79L"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb79db329so527428766b.2
        for <loongarch@lists.linux.dev>; Mon, 18 Aug 2025 02:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755509928; x=1756114728; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdEYA7o1VzPQoYIPoKPNZkexWdwuehcnlbt0D0zOaP4=;
        b=bTb9m79LrLjZNoRWyckuuZIwKpMQgCs9AlXosmGS2RUCNys2M2tR8ha7rCfrFROJeF
         k/hrlI8H/mvUxBefS0x42dNSl1l/J5Si/gtuX29wf5OXUdCk/1gwDzOSnpGdw4oICNTb
         4r2nKGFNoDJYuQa/bhobwTfZ7noovztPD5XYo8SiAClhk8G6sA/2h0HpQzRuLn1HkwLb
         KuvpYsfdk91kBQlRJuKtKpFA6gChsVNv0Wdw42TN2oRNAjhZxIl03sNG1TvWk9/zNDjj
         0OECDlpkntsYbuqQyEOdQTtkuiNf29LSTUrP//UVvzd7VVYiXxqMQDXQjSjAP4kHVyYM
         yC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509928; x=1756114728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdEYA7o1VzPQoYIPoKPNZkexWdwuehcnlbt0D0zOaP4=;
        b=BIkHt+U2XkLpCkCQMjrfkcNngzELAi9x4BYnqBxRMFVWbg4oYXqgveVk3mK1q5oEEO
         bKNrXvTnhZ140BHGx0TFNpbTRIQdRJX4K5tZz4bAEgTmFpXiEMcj2L0xEYDff8s1rSkM
         w7D5WmHf2MRcl6cLdW3NveuNqfm6bFgqfY5T5RjFIaOd60XOcdrA3ZmVLr1yh4vX5IsQ
         XkoNvXmooyt8AF6Hy3+nB2NH0PWEX0Z/eW0rAtP+LJqRFIBTyk4JOy706VTpeovZ9mlO
         euOo02gsX0L4UfPpCq9H917DRq5PvS+PohnN4WxKtpSw4lq8jaGmycfjqUKJ6aChfUiw
         cczw==
X-Forwarded-Encrypted: i=1; AJvYcCWVr0sgNkKBMqmLi/h7mAJyKGPAWGbIwooWP1NAvOILf7EZPuYJjKtx1poBDbPGYeui3Mr9t/UVKAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKb6ZOor0AItbh3GUlW4EJd5tWH6k9Omi7TPvxY3FmqQLwRW5c
	WUYhhi8RdR3Db1LeyzfCZMvA42HJqE+3Bt4wrrtypUqLGEkQ1gVj+VzVvnVRZ+mDcRSN+R6XdwR
	ypXnU4MXkSusynrxE1pfBEVujxUh0mhg=
X-Gm-Gg: ASbGncsqkH665Lq92o4a1Byh53GYtVJSUxb7KKkPnntOSBDRK3NYZIEPF5eyYQR03dK
	4DbqpXc4CKb/zkVZDG3KqPKbOgXkmV7gnyfdKYJ/jR4ymFTZLGvnU5VGybKb2PDhWa0TEjtlhxT
	tbGtZ1LpqeaZPcTyzyGI7dMRMSjcoNxS2EeY3GVW8RqbpBeI/KjXk583N5x1PMHJNiYeWk0BZtC
	zas536SnvYBhYSfuw==
X-Google-Smtp-Source: AGHT+IE05VSrIMyvebGx0unCj4GEX/dqppJmwwCUmpmbrew8a29RQ3aQtfuq56iATh9CZLY2/vFkW+lSc+G0qBDC+B8=
X-Received: by 2002:a17:906:c107:b0:ae2:9291:9226 with SMTP id
 a640c23a62f3a-afceaea7031mr791267166b.59.1755509927350; Mon, 18 Aug 2025
 02:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250816104904.4779-2-xry111@xry111.site> <n5kdswq7oduruqiruyup4rcdwrs76tlinz26swotzeqklterey@off5cbv5i4e5>
In-Reply-To: <n5kdswq7oduruqiruyup4rcdwrs76tlinz26swotzeqklterey@off5cbv5i4e5>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 18 Aug 2025 17:38:34 +0800
X-Gm-Features: Ac12FXzZ4KQDTgw3dey84zGRTpNWmm8rMIDLoaxRtbeHhBij0UBaLMWuq9ycu7o
Message-ID: <CAMpQs4LqEWSoMUZpcbyknuEvf48FMMgra+Jffk0AXvTiZYjANg@mail.gmail.com>
Subject: Re: [PATCH] pwm: loongson: Fix LOONGSON_PWM_FREQ_DEFAULT
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, linux-pwm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xi:

Thanks for your patch.

On Sun, Aug 17, 2025 at 6:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> [adding Juxin Gao to Cc:]
>
> On Sat, Aug 16, 2025 at 06:49:05PM +0800, Xi Ruoyao wrote:
> > Per the 7A1000 and 7A2000 user manual, the clock frequency of their
> > PWM controllers is 50 MHz, not 50 kHz.
> >
> > Fixes: 2b62c89448dd ("pwm: Add Loongson PWM controller support")

I have confirmed once again that this was indeed my mistake. Thank you agai=
n!

Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> A quick glimpse into
> https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-userma=
nual-EN.pdf
> confirms this, so I tend to apply it. I'll wait a bit to give the people
> involved in 2b62c89448dd a chance to comment.
>
> Best regards
> Uwe

--=20
Thanks.
Binbin
