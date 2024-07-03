Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70297282E1
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720024321; cv=none; b=VUbcs9+cs9Q9bGA+C1MukWHUHFj7I4/0fmf0BnqVleHW9rL/lsGXjRE58jbt0eah7T8DBj6nfC3fVdR8A/ifqgmP3L7+z/2mpmLEc+8ZuEf4hk6b3wRgCQ/kAbI0MjdHWfnfmoAx9a1PuoDpvUnZZkUBU7vc465o/vJ+KLgv3og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720024321; c=relaxed/simple;
	bh=aX/dntK47yBZoBKXBogHtsXyVUj/EEsdEqcWuVR2MNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H9RaOecy94uXdyKZAyLcnlznH5bw7m25XICLWq7SGUtgxToLV7OVHASUpKDcAsB/de1mYk9xNX/4nWwck3T7IrD6cheWzZRm5Uo67Cst3KB299eX7rgfEjxYEvLvFhnGCSVvJzXdv5h4Dgj1RzixdZTTv+Uft7/AZlx11kgOU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WIZuZOmR; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WIZuZOmR"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a724a8097deso690595566b.1
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720024317; x=1720629117; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyado1sFM+cGedSAqHu7B/wZSU2t+kg2eHyPGnCfXa8=;
        b=WIZuZOmR2j0/PzpjyPgbE9D7cGZClFyo1UpLEGJVhR7F3BIUMAtYBOy0DzS2BU+gPv
         UBwdpUgRMPk5U7UtXsZ+HADy2FR4r9tCg+MH2ahpp0p292ASbeuHhYmIjBFFecs5ozYo
         sNAdyHXBvEgKzYfnNRWefrbOWbx2uyjOUY+Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024317; x=1720629117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyado1sFM+cGedSAqHu7B/wZSU2t+kg2eHyPGnCfXa8=;
        b=pN0c0vVoyjovhJ5X5DYR2k2mwe0HRBbkX7yEzCLseVW/myqWnE7UUXxBsguk/w/ram
         LdvO9jyUbZhSQ0zFnHSsmrR/fS4Wvxmvf9VDotXOTpJjIUDbW+fUTVG+i0cvp4dmwmmz
         IuNoCXSvacmtTIeMQE+ix/Hc4e834DLBK52XiB+85AxDh3j7qyRr18r3tjI8MNCrZcb/
         f2eU6l/vZ3XbnuHqISsG2EN1UBKjBxwvVbWb/oP2sjcIntYawOrzqqqAAHbSw5HFFO0P
         CRtFvGi/sqVzM/L9uDPkMdEVvyJpoUg5KpMBdqUk9ERF4d6zTJI75ozWdLAVdLbk8e07
         KqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZjrrVfHVCRdykjAjxAM02t9pgC+l+W4mTUDi5bxlM+yix52LYLBuDVd3zBu5vnCdMXx6eA+A0RYPpCGwaZoiPSh7vklnmSV+C
X-Gm-Message-State: AOJu0Yyeg7h71VRjlkR9NIbI5WHnuVKHNEyY1v28mfEoNXEbl5PCE79E
	cE/2BiEspKR8MaqKPe5AupqV14+glyJQ3rMUEIjd8YzatcvUuI0cGlc28/aT51hWZyuUx03mYzN
	4KgGejg==
X-Google-Smtp-Source: AGHT+IFB1hcSA+QUU1RzFUD+vy+N/Ozw8yBXY5WarH9/lFAnHOFhsTx+xanhqRA4oF5UoiTkzwzAtA==
X-Received: by 2002:a17:906:fcd6:b0:a72:6055:7886 with SMTP id a640c23a62f3a-a751440e887mr692904666b.24.1720024317641;
        Wed, 03 Jul 2024 09:31:57 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf5a585sm522071166b.52.2024.07.03.09.31.56
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 09:31:56 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58b966b4166so2756833a12.1
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 09:31:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU89eO3U2bGMro9gIIF0zYll97NxNiPfVgqDQGQh4j/xSs/bG7/k0ahix+Vmnfx6dE4K1Vv03e35uUwMOxDPZBiQU8P05aY8HuI
X-Received: by 2002:a17:907:368a:b0:a75:3f38:e0a4 with SMTP id
 a640c23a62f3a-a753f38e1a0mr459327066b.47.1720024316186; Wed, 03 Jul 2024
 09:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625110029.606032-1-mjguzik@gmail.com> <20240625110029.606032-3-mjguzik@gmail.com>
 <CAAhV-H47NiQ2c+7NynVxduJK-yGkgoEnXuXGQvGFG59XOBAqeg@mail.gmail.com>
 <e8db013bf06d2170dc48a8252c7049c6d1ee277a.camel@xry111.site>
 <CAAhV-H7iKyQBvV+J9T1ekxh9OF8h=F9zp_QMyuhFBrFXGHHmTg@mail.gmail.com>
 <30907b42d5eee6d71f40b9fc3d32ae31406fe899.camel@xry111.site>
 <1b5d0840-766b-4c3b-8579-3c2c892c4d74@app.fastmail.com> <CAAhV-H4Z_BCWRJoCOh4Cei3eFCn_wvFWxA7AzWfNxYtNqUwBPA@mail.gmail.com>
 <8f2d356d-9cd6-4b06-8e20-941e187cab43@app.fastmail.com> <20240703-bergwacht-sitzung-ef4f2e63cd70@brauner>
In-Reply-To: <20240703-bergwacht-sitzung-ef4f2e63cd70@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 09:31:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi0ejJ=PCZfCmMKvsFmzvVzAYYt1K9vtwke4=arfHiAdg@mail.gmail.com>
Message-ID: <CAHk-=wi0ejJ=PCZfCmMKvsFmzvVzAYYt1K9vtwke4=arfHiAdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Christian Brauner <brauner@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 01:46, Christian Brauner <brauner@kernel.org> wrote:
>
> We've now added AT_EMPTY_PATH support with NULL names because we want to
> allow that generically. But I clearly remember that this was requested
> to make statx() work with these sandboxes. So the kernel has done its
> part. Now it's for the sandbox to allow statx() with NULL paths and
> AT_EMPTY_PATH but certainly not for the kernel to start reenabling old
> system calls.

Those old system calls are still used.

Just enable them.

statx isn't the promised land. Existing applications matter. And there
is absolutely nothing wrong with plain old 'stat' (well, we call it
"newstat" in the kernel for historical reasons) on 64-bit
architectures.

Honestly, 'statx' is disgusting. I don't understand why anybody pushes
that thing that nobody actually uses or cares about.

                Linus
