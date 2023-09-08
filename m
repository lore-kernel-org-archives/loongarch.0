Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1351F210F
	for <loongarch@lists.linux.dev>; Fri,  8 Sep 2023 19:48:27 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9a65f9147ccso302236566b.1
        for <loongarch@lists.linux.dev>; Fri, 08 Sep 2023 12:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694202506; x=1694807306; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d1dUW7fJkCquDjjruKJF9ic5ByrdeDFJnU0IlXTs1QI=;
        b=M6P7/pSB3e7HeoctkWcDVPJBwxqVY7Ey39MSfbBDUNF0PA+OrtpuQ3iEsoTbRxTiNp
         MgS5hlFnThi8sIQu2FrsPPXtA1yg8vlR3/Dmn/EQPW3ZMTiCLwpY7rGb2loQC0QS/vQQ
         7pp/A38SJmSfjEKIZmjxaI0j2ZeX/ILQLeMAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694202506; x=1694807306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1dUW7fJkCquDjjruKJF9ic5ByrdeDFJnU0IlXTs1QI=;
        b=DSwYs2lon6CERdBbIeBj0LBzV/MteH5dKZ9R/+bKIXrBZYVcNqMvlj2PP9wJYh1Nf0
         FAVcZOGwa7VDGsjiiqmJKBIBnd9TwcBDXIq2tIV059bS2sewO4/2PElkGQJXPn92/J+0
         zIKHss+i94IMnnFs114k4r0mfiCPIvksXI0BupEaES5NAPmCtT8+VkldOiTjhL5ql3Lo
         idQHROBSW2ShOcSEb2GEJLsYPgou7byrmkBP+e0a1IaSRjbHf3hESGZzLye7bjUMbO20
         m/MfKFc0FNfam0Z+3u5mhFxcGKZRlfaFx9ZRSInyoydXZd+ds/QFxWwFnCfOknh9JC+y
         zUpw==
X-Gm-Message-State: AOJu0YwIfWsR2xuXA8mDB9L5x41oEdaPBssdrGvVbNNfeISNgtior/uV
	MatagkGcWAFvRyz2a5hOKz1QgoP5gNXNptb+idVyo1b1
X-Google-Smtp-Source: AGHT+IFcdkeYUqadsiUpu/Iajs4W++v4wR7uL3C6wgyskxOqtGOfmip3j+T4jaH1kUPe+YTmn627mg==
X-Received: by 2002:a17:906:18:b0:9a1:c00e:60cb with SMTP id 24-20020a170906001800b009a1c00e60cbmr3039949eja.10.1694202505894;
        Fri, 08 Sep 2023 12:48:25 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id k24-20020a170906971800b0099275c59bc9sm1433071ejx.33.2023.09.08.12.48.25
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 12:48:25 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9a65f9147ccso302234966b.1
        for <loongarch@lists.linux.dev>; Fri, 08 Sep 2023 12:48:25 -0700 (PDT)
X-Received: by 2002:a17:906:cc12:b0:9a1:e293:9882 with SMTP id
 ml18-20020a170906cc1200b009a1e2939882mr2646204ejb.63.1694202504918; Fri, 08
 Sep 2023 12:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230908111053.1660033-1-chenhuacai@loongson.cn>
In-Reply-To: <20230908111053.1660033-1-chenhuacai@loongson.cn>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 8 Sep 2023 12:48:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-uoZ_XsZ4fDodqjUY+rYJq=D3RVme3f=zBDB5neWhKQ@mail.gmail.com>
Message-ID: <CAHk-=wh-uoZ_XsZ4fDodqjUY+rYJq=D3RVme3f=zBDB5neWhKQ@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch changes for v6.6
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Sept 2023 at 04:11, Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> 7, Add KASAN (Kernel Address Sanitizer) support

I have pulled this, but please at least consider

 (a) don't use the stupid and random __HAVE_ARCH_xyz defines

Yes, yes, we have historical uses of it. That doesn't make it good.
Instead of making up new random symbol names, just *USE* the names you
are defining per architecture.

IOW, instead of doing

  #define __HAVE_ARCH_SHADOW_MAP

and defining your own helper replacement functions for
kasan_mem_to_shadow() etc, just use those names as-is.

So if you have an architecture that has its own version of
"kasan_mem_to_shadow()", then use *THAT* name for the #ifdef too.
Don't make up another name entirely of the form "__HAVE_ARCH_xyz".

Example: architectures can override the default generic versions of
"arch_atomic_xyz()" operations, and the way you do that is (for
example)

  static __always_inline int arch_atomic_add_return(int i, atomic_t *v)
  {
        return i + xadd(&v->counter, i);
  }
  #define arch_atomic_add_return arch_atomic_add_return

note how the define to let you know the name exists is the name itself
(and because the implementation is an inline function, not the macro,
the marker is then just a "define the name to itself").

End result: no made-up secondary names for other things. When you grep
for the thing that is used, you find both the implementation and the
marker for "look, I am overriding it".

And also

 (b) do you really want to inline those kasan_mem_to_shadow() and
kasan_shadow_to_mem() things?

Yes, the caller is addr_has_metadata(), and that one is
"__always_inline",. because otherwise objtool would complain about
doing function calls in SMAP-enabled regions.

HOWEVER:

 - on LoongArch, I don't think you have that objtool / SMAP issue

 - and if  you did, the function should be __always_inline, not just
plain inline anyway

so I get the feeling that the inline is simply wrong either way. Maybe
that function should just be declared, with the implementation being
out-of-line? It seems unnecessarily big to be an inline function, and
it doesn't seem performance-critical?

Neither of the above issues are critical, and the second one in
particular really is just a "did you really mean to do that" kind of
reaction, but since I was looking at this, I decided to write up my
reactions.

              Linus
