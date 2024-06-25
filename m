Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093651482F8
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719321234; cv=none; b=bmuecWPg0/OUvCp6iajMP/WXZpMWbIG/GYSM8s+y8sr8YQ4IqgQ65zsMZudMCkVN+0uObdqgoxxnQINQwpdrJkbUKOdhWSdKYjqdxBzA54cW51e9dBncLGN3spE47a8L/ytG9bUgGJmdquaKSYzDzvuAwbw33PhbLzc7/6ZocRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719321234; c=relaxed/simple;
	bh=LenyA9+Q6yORuJax1aNhoSGTHebJWb0mapvIs+m1FOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3ZejqJdXVGLrk+ppanamguXhTfx0su3lvbz4HVyE/DMjd5zC9sjByZfpBJ3ODVViBlHY6ZSLCu63Gr0tlw+h7VnJteMjSoyPtc07o3LsE0ktu8agWgmz5IoCetAzvoAUM0Hk6igncoRfI+f1LsU17AP40rYe3NAu/7tFg0ctWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9Tg5nLM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9Tg5nLM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cb9efd8d1so10545216a12.0
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719321231; x=1719926031; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGzpktfJRyUxPQFZpXSO9yzkCznXX9uHT8bGtJuHl7k=;
        b=l9Tg5nLM0Wk4UbOwIAiSrMCaGtecl694g3UT+gtHlug93cseWR8UdYDc+d+xE4wty0
         Kh4hKUg6Mhfmi1o0PcUqGXz2UFXtH02/yklw02ieowAGlS31BUbNKdrlwyBeZCIUUMOe
         kpmilmLjaTi0Kd6sGtjcxFy1rTZQ7xuzFlNg+XTIpZG5zTyrPxpT58Pm/lNep3g8yesa
         jQ262bmDeS0PPTunWZB5uLUXsRq+6yS97HIlcbzSOfmx3ZBIrNdBdPsCkXeDIfE6ZwfB
         urVJ5wPvzaEtrFF6dlZj2s1zOlhO+OZGOvlf3pNDZ1AppPOSU1WZTeQthFnopOmUwHEy
         kC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321231; x=1719926031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGzpktfJRyUxPQFZpXSO9yzkCznXX9uHT8bGtJuHl7k=;
        b=dOk5F35/q3xvYIz92zo4f62DpvBQ46QH88WCdmNlID0qMy1qDGPFAH3WTiFBIA5wDm
         dElAK75bzxhJpqN00b0Es4NzhdggtsoXZPFgBHaVZ5S3lTE/AHPsF8EfGB3NGThtCQy5
         K9E/apilXBwDJDPJe72Sv2iVDXohNde8IKLJo3HW6zZzGPbIM3DJOGmG0oM8RsnDqOU8
         xalkZ1AZOmxz0TQ6v22lRuymhIF2iF8yDnGdtIAQGqriEIN5r2wUqsaCJ2sTdylDnwKf
         1LRBq+aR5rGQFMugKrQZhvCjt2BTl+yku39geoyB7IuLx5Ui6PaTb2n4FtZd31HoigIT
         ngiw==
X-Forwarded-Encrypted: i=1; AJvYcCUaqrR4G73Puq0uKNYMQicJ75dVIp9sGeghpB+00x8gLX8rOL+0Bb1EkmrK1Ey/i09fD93jPCfPoG3bcMmqPyGg7KRfOpvOc0h2
X-Gm-Message-State: AOJu0YxhVrQ+7vA6t+M9yh0y4diKNl0xEqGHXVSz9/oDZIBysRRxNO0R
	Ke/D03eR8xUhM+LS8gDpdzxnrizApwuvRnjfO1H4C/fYK4xckAqawA5nKx15lss2HzKSKAHBF3a
	OGhNenkyxTFsNkajqBbqeoqrVCG+3RdTb
X-Google-Smtp-Source: AGHT+IHh0ZN6yJu8kV5hXz37pyRTo/0xrpIijyxYdmwWm/0ViHT6iwVzEMCIC7Y/3WlXQk5jm4DyBBE4cruOAxFPnnw=
X-Received: by 2002:a50:d547:0:b0:57d:3e48:165d with SMTP id
 4fb4d7f45d1cf-57d701ba9c2mr1894059a12.4.1719321231250; Tue, 25 Jun 2024
 06:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625110029.606032-1-mjguzik@gmail.com> <20240625110029.606032-2-mjguzik@gmail.com>
 <19ec107368c8c8dd4e627b404106c30b73132cb0.camel@xry111.site>
In-Reply-To: <19ec107368c8c8dd4e627b404106c30b73132cb0.camel@xry111.site>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 25 Jun 2024 15:13:38 +0200
Message-ID: <CAGudoHGNU3V6+4N+zEsQKUczJqgi6vbtJ2pWowVhZZR7cYDbSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] vfs: add CLASS fd_raw
To: Xi Ruoyao <xry111@xry111.site>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, axboe@kernel.dk, torvalds@linux-foundation.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 2:23=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Tue, 2024-06-25 at 13:00 +0200, Mateusz Guzik wrote:
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > ---
> >  include/linux/file.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/file.h b/include/linux/file.h
> > index 169692cb1906..45d0f4800abd 100644
> > --- a/include/linux/file.h
> > +++ b/include/linux/file.h
> > @@ -84,6 +84,7 @@ static inline void fdput_pos(struct fd f)
> >  }
> >
> >  DEFINE_CLASS(fd, struct fd, fdput(_T), fdget(fd), int fd)
> > +DEFINE_CLASS(fd_raw, struct fd, fdput(_T), fdget_raw(fd), int fd)
> >
> >  extern int f_dupfd(unsigned int from, struct file *file, unsigned flag=
s);
> >  extern int replace_fd(unsigned fd, struct file *file, unsigned flags);
>
> FWIW this change is already in the mainline kernel as
> a0fde7ed05ff020c3e7f410d73ce4f3a72b262d6.
>

Thanks.

I guess I should have rebased that branch before adding stuff on top
of it, no damage done though. :)

--=20
Mateusz Guzik <mjguzik gmail.com>
