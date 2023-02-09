Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45B36C
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 02:15:04 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id d8so499965ljq.9
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 18:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR54mJXwASvQGnAdij+ZNHiNC8eGa7TLZRG1R8sZ1FE=;
        b=CGN/82Z0Rf2APBROkVXBhyeM/niTSI8x1hqX4A2fudHYjjDuyT2/rKROdDEYgYmFTI
         Fw66UeDlGPJ1sOM+AaZtSJZuWBo3A5lcBYMDjQbQjMY6Z/1o6EUNPOYB7+asfROVfo8Z
         32rGO9TlqQ03qZfuAhF9IPX0sWUwTYCnT1U03OCCsYVze0ZT2lCfN55VY2w69qManxY8
         8GxP5U8z0TIZ6GFEBEyZfiVirNoKAV3u3wulYD/legsWhveNsCdF1pXutvrDIzgQ99pp
         6Dc+1dglsYQpmxHcU4pigvLC7cCeK3LHq6IF3KYglPTZhdSmva3SXbd/bbmrVMmKn9FZ
         p0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZR54mJXwASvQGnAdij+ZNHiNC8eGa7TLZRG1R8sZ1FE=;
        b=XV83S5806E5z/NjYCaeTdSTU9Dqf++eoGLJ1+p5kWW9ONHcyDg63vz2QS7/BG7o2Qt
         AShGs6EgusS8SWsMTWlCUfJqR63WCRVMBu7KGW7Dk6JR06GwXgbnR1uCT1m7T+UZkvO1
         sk4us8QHtuiSMp0GyJ8iA/XZY3k1V8nSXnE9lYdFjeMCrMuvC9kKCb62OF74+eOtu8vw
         PvtzqPO0HM05/3xCRLxh2Mfp8rg9hsQuGjIQ3qzvmcJHzLTVJA97fOpSmv2FeqbtgeB6
         W3UVi3NtLMOvUwLUrHJu23K7jG9DXIlW5ta7rjKFw3LSZpaDUAdakVJQKtGJlE9K/jAt
         hSMA==
X-Gm-Message-State: AO0yUKUHjAUMf4JqSp2GIfIy5dywNQmrz/qBhjk46+aA5hxeGh2Y45c2
	gQiCa3P5Zl5XsXxuEdOiAVDwdj7iVBzbYrQPDvU=
X-Google-Smtp-Source: AK7set+agdxY6pTTDEx797/vZ5UWomhA83EIT9xQ1l9iTwj7V4rHHdxzX0o/dedbejg+xZX2FUN6KBI/fg3c9kt1JUs=
X-Received: by 2002:a2e:8e6c:0:b0:28e:bba7:22dc with SMTP id
 t12-20020a2e8e6c000000b0028ebba722dcmr1669351ljk.56.1675908902331; Wed, 08
 Feb 2023 18:15:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675851111.git.chenfeiyang@loongson.cn> <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
 <de9439e489684965989ac4e96b87de41@AcuMS.aculab.com>
In-Reply-To: <de9439e489684965989ac4e96b87de41@AcuMS.aculab.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 9 Feb 2023 10:14:50 +0800
Message-ID: <CACWXhK=VXaMixrDTdo-ydgGw64vemu9kNUws5ef-91TFf-GPGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
To: David Laight <David.Laight@aculab.com>
Cc: "w@1wt.eu" <w@1wt.eu>, "paulmck@kernel.org" <paulmck@kernel.org>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	"arnd@arndb.de" <arnd@arndb.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Feb 2023 at 06:39, David Laight <David.Laight@aculab.com> wrote:
>
> From: chris.chenfeiyang@gmail.com
> > Sent: 08 February 2023 10:18
> >
> > loongarch and riscv32 only have statx(). arc, hexagon, nios2 and
> > openrisc have statx() and stat64() but not stat() or newstat().
> > Add statx() and make stat() rely on statx() to make them happy.
> >
> ...
> > +#ifdef __NR_statx
> > +static __attribute__((unused))
> > +int sys_stat(const char *path, struct stat *buf)
> > +{
> > +     struct statx stat;
>
> If seems wrong that 'stat' has type 'struct statx'
> and 'buf' type 'struct stat *'.
>
> Maybe s/stat./statx./ and s/buf->/stat->/ ?
>

Hi, David,

Yes, it looks better to use 'struct statx statx'. Thank you!
I'd like to keep 'buf' to be consistent with the stat() below.
int stat(const char *path, struct stat *buf);

Thanks,
Feiyang

>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
