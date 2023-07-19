Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8938830
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 10:55:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fbbfaacfc1so11165476e87.1
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689764127; x=1692356127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=crS3CSY6szxFlGqC0R3v++4ayIAdFFaeNUOCZ6hKf28=;
        b=ZiKC0YFsXf/R3jipNPfVIY5KgeG84dUlqbCtWAg6V8AGXiMt6ZSY+4RwN/+5X/ARVp
         ohUibp4WtghvVVtTMu1cmE4QEm32WEIhkPkIr/YkCJMNlrvmfkud2ckKdtu/1MLNWqYW
         gnpxURiqZXCNRB9z1xVBXfLF0A/W7mBkwHlmkH/mVu2FrpxYHTebt02mTQTdmy+23CLg
         tcBcB/K2MKP8W+B+r0cNtH0W3bKDGhds3yUjs3kCzuiq9Wx58Q//fwKGMc5J1cQiGudL
         N796KqjiS3J+cB6dy9MmerW57k0y0RuOtMfuYXA5iQ2lnwI8G34VRu8c5S4uQmiWUWS3
         mYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689764127; x=1692356127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crS3CSY6szxFlGqC0R3v++4ayIAdFFaeNUOCZ6hKf28=;
        b=VYxrImRMhEYGWoHmANt41+71aBVsK1j74cxzhkcIhtVojzD9zzV3BtdfQ5sUzF7Fos
         u/ZIsq4nH01tIarBtWkggyOl7Z2RGddwHuhCXOBe9zKkn+6Dh2yVTtR/m2xQbL9qEYk1
         q2izeHkLina54fjhTwhyhFgJAJTYUG+DOgfZGD5m+hgeTbSxfHzpV0tr9nZFksvt3WrT
         rKReT7qwRTmEugFC+l9WM5eoqtb8TiDlNbPifQFFNrTbjaY/yOFoA7vDGUwEzSzM6cdn
         GjSbCcIhRgDDDqFszbJGilvAMoTZ+UKr/Rt2J5Vqag3DEwszvI6nwLq2nR9sZadYgHO5
         vcdw==
X-Gm-Message-State: ABy/qLZsBZgrtF7VTOFhzw3D7G3ne7eaGWNu9R4qytKNNI2x3MNxf+cQ
	CP+nmUPZyBuYRHYTP8mssnrtw5xijpHWhAAAaufwww==
X-Google-Smtp-Source: APBJJlHdvyvpRFFm1VTfzH+Tt0JUWjZvrNpoITi8/TcyUtirJ5DyLJrCuQnUxjvJp89HvM/AkCXAzbja2xsmXHz5sqc=
X-Received: by 2002:ac2:4e8e:0:b0:4f8:b349:6938 with SMTP id
 o14-20020ac24e8e000000b004f8b3496938mr10924928lfr.65.1689764126796; Wed, 19
 Jul 2023 03:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-4-lienze@kylinos.cn>
In-Reply-To: <20230719082732.2189747-4-lienze@kylinos.cn>
From: Marco Elver <elver@google.com>
Date: Wed, 19 Jul 2023 12:54:49 +0200
Message-ID: <CANpmjNOHL8EMP+E9w5wxMJ+PUbxYZh2DMaEocfHP1ATQn64+ng@mail.gmail.com>
Subject: Re: [PATCH 3/4] KFENCE: Deferring the assignment of the local
 variable addr
To: Enze Li <lienze@kylinos.cn>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	glider@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jul 2023 at 10:28, Enze Li <lienze@kylinos.cn> wrote:
>
> The LoongArch architecture is different from other architectures.
> It needs to update __kfence_pool during arch_kfence_init_pool.
>
> This patch modifies the assignment location of the local variable addr
> in the kfence_init_pool function to support the case of updating
> __kfence_pool in arch_kfence_init_pool.
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>

I think it's fair to allow this use case.

However, please make sure that when your arch_kfence_init_pool()
fails, it is still possible to free the memblock allocated memory
properly.

Acked-by: Marco Elver <elver@google.com>

> ---
>  mm/kfence/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index dad3c0eb70a0..e124ffff489f 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -566,13 +566,14 @@ static void rcu_guarded_free(struct rcu_head *h)
>   */
>  static unsigned long kfence_init_pool(void)
>  {
> -       unsigned long addr = (unsigned long)__kfence_pool;
> +       unsigned long addr;
>         struct page *pages;
>         int i;
>
>         if (!arch_kfence_init_pool())
> -               return addr;
> +               return (unsigned long)__kfence_pool;
>
> +       addr = (unsigned long)__kfence_pool;
>         pages = virt_to_page(__kfence_pool);
>
>         /*
> --
> 2.34.1
>
