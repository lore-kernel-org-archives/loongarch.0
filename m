Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB089296BAF
	for <loongarch@lists.linux.dev>; Mon, 10 Aug 2026 02:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786327628; cv=none; b=rPILsyPZqejCpbbn03i+pAGvm/C9nIroQyA5uji+Ce9eqBM+UNnOxFGzS8LgFwK8hpenUcIY1qSGVgpzn1MA5tNBdH+RGo+Zy5JeeszYyqoa8QBd9Mgq+glDrnTrxYsJ+zfcMvHZDCnAIW47XhNgRlebim51wBJ8Xes+LX7Z7X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786327628; c=relaxed/simple;
	bh=GAktumss79iUjrqwFgW/jzZTDOuIRd0bFHbvQ/DFkf0=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uxA5WlPCtAC6Tpn/wk5ZAf4ZVxV4D51rpMmSiW5ZPDc/w2DDsXb7Ni8x3VXerb5MTM/RZL1VEj6II88+8xUrwNcmJKrqe8+IJTzIJ5uO9H/rldgXfMb15iBdIxTAz23Sa5byvjTbONo1UOIoslrC03vL/MBDPMRieEBUAdeSigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Dx9+pBMnlqPMsLAA--.37399S3;
	Mon, 10 Aug 2026 10:06:57 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxb8c4MnlqxSoqAA--.32057S2;
	Mon, 10 Aug 2026 10:06:49 +0800 (CST)
Subject: Re: [PATCH v1] module/kallsyms: Filter out local mapping symbols
 during module load
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260808033715.13117-1-yangtiezhu@loongson.cn>
Message-ID: <71fe6152-65f8-cf30-08d0-004c2a7d922a@loongson.cn>
Date: Mon, 10 Aug 2026 10:06:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260808033715.13117-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxb8c4MnlqxSoqAA--.32057S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw1DuF17Cr1rWr47GF13WrX_yoWrZr13pr
	15JrWFgF4rJr1jga18CayY9ay5G34kWrZI9as8Gwn3Arn0qFyjv3Z7KF1fZw47ZrsxKr12
	k3s7ZFy3ta4UJrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==

On 2026/8/8 上午11:37, Tiezhu Yang wrote:
> The compiler toolchains generate internal local labels on certain
> architectures (such as LoongArch) for optimizations and relocations.

...

> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> Based on the latest modules-next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git
> 
>   kernel/module/kallsyms.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index f23126d804b2..61dd5c014a59 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -130,6 +130,9 @@ void layout_symtab(struct module *mod, struct load_info *info)
>   
>   	/* Compute total space required for the core symbols' strtab. */
>   	for (ndst = i = 0; i < nsrc; i++) {
> +		if (is_mapping_symbol(&info->strtab[src[i].st_name]))
> +			continue;
> +
>   		if (i == 0 || is_livepatch_module(mod) ||
>   		    is_core_symbol(src + i, info->sechdrs, info->hdr->e_shnum,
>   				   info->index.pcpu)) {
> @@ -198,6 +201,10 @@ void add_kallsyms(struct module *mod, const struct load_info *info)
>   	src = kallsyms->symtab;
>   	for (ndst = i = 0; i < kallsyms->num_symtab; i++) {
>   		kallsyms->typetab[i] = elf_type(src + i, info);
> +
> +		if (is_mapping_symbol(&kallsyms->strtab[src[i].st_name]))
> +			continue;
> +
>   		if (i == 0 || is_livepatch_module(mod) ||
>   		    is_core_symbol(src + i, info->sechdrs, info->hdr->e_shnum,
>   				   info->index.pcpu)) {
> 

Hi module maintainers,

Regarding the feedback from the AI bot about livepatch breaking [1],
there are two ways to fix it, which style do you prefer?

(1) Using continue

```
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index f23126d804b2..aece7aa49dd4 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -130,6 +130,10 @@ void layout_symtab(struct module *mod, struct 
load_info *info)

         /* Compute total space required for the core symbols' strtab. */
         for (ndst = i = 0; i < nsrc; i++) {
+               if (!is_livepatch_module(mod) &&
+                   is_mapping_symbol(&info->strtab[src[i].st_name]))
+                       continue;
+
                 if (i == 0 || is_livepatch_module(mod) ||
                     is_core_symbol(src + i, info->sechdrs, 
info->hdr->e_shnum,
                                    info->index.pcpu)) {
@@ -198,6 +202,11 @@ void add_kallsyms(struct module *mod, const struct 
load_info *info)
         src = kallsyms->symtab;
         for (ndst = i = 0; i < kallsyms->num_symtab; i++) {
                 kallsyms->typetab[i] = elf_type(src + i, info);
+
+               if (!is_livepatch_module(mod) &&
+                   is_mapping_symbol(&kallsyms->strtab[src[i].st_name]))
+                       continue;
+
                 if (i == 0 || is_livepatch_module(mod) ||
                     is_core_symbol(src + i, info->sechdrs, 
info->hdr->e_shnum,
                                    info->index.pcpu)) {
```

(2) Using if-statement
```
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index f23126d804b2..b2b22b3487a8 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -130,9 +130,12 @@ void layout_symtab(struct module *mod, struct 
load_info *info)

         /* Compute total space required for the core symbols' strtab. */
         for (ndst = i = 0; i < nsrc; i++) {
-               if (i == 0 || is_livepatch_module(mod) ||
+               bool is_mapping = !is_livepatch_module(mod) &&
+ 
is_mapping_symbol(&info->strtab[src[i].st_name]);
+
+               if (!is_mapping && (i == 0 || is_livepatch_module(mod) ||
                     is_core_symbol(src + i, info->sechdrs, 
info->hdr->e_shnum,
-                                  info->index.pcpu)) {
+                                  info->index.pcpu))) {
                         strtab_size += 
strlen(&info->strtab[src[i].st_name]) + 1;
                         ndst++;
                 }
@@ -198,9 +201,13 @@ void add_kallsyms(struct module *mod, const struct 
load_info *info)
         src = kallsyms->symtab;
         for (ndst = i = 0; i < kallsyms->num_symtab; i++) {
                 kallsyms->typetab[i] = elf_type(src + i, info);
-               if (i == 0 || is_livepatch_module(mod) ||
+
+               bool is_mapping = !is_livepatch_module(mod) &&
+ 
is_mapping_symbol(&kallsyms->strtab[src[i].st_name]);
+
+               if (!is_mapping && (i == 0 || is_livepatch_module(mod) ||
                     is_core_symbol(src + i, info->sechdrs, 
info->hdr->e_shnum,
-                                  info->index.pcpu)) {
+                                  info->index.pcpu))) {
                         ssize_t ret;

                         mod->core_kallsyms.typetab[ndst] =
```

If you have any more comments, please let me know.

[1] 
https://lore.kernel.org/linux-modules/20260808035301.C3E6F1F000E9@smtp.kernel.org/

Thanks,
Tiezhu

