Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048CB3D75AD
	for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544056; cv=none; b=Q07VFotpt8BWupBIxG4ssKNLw3ANL5te8D5Oq4/yyKCKoUacclGdF71s/Muo8df9G6uTuxBJgMwJhWvIpCPbPqZQO8QDlSezvOtt/tkYYfPccaM002bTdl/Tw1wgTpcPtxO4/CPaWfeRCSFdhN3RvLrXE4B53uhpCtu6rpYLSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544056; c=relaxed/simple;
	bh=dzXSNrm5ivREgGs/tD6QrqtHxbGOYzsk6uHJjTBDMd0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=K1R/MIMEyiv3nKet8pXn/mSz+qojGW93TmQ5wbr5Xq6i/I1hQAC7Zzxgql3XMDiLgYQ0r94wjpTMOs3RFHsSHhse27ZmibLIzKDe4SROOkl1gWd7rKr47Kz67dN1iXQUAJYeJcu2uB3CZMqZ5ucZY4E3GoUFcgKd6p4bEEEJvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx7+sv+11qEz8FAA--.20800S3;
	Mon, 20 Jul 2026 18:40:47 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxTOUr+11qZNMSAA--.34772S2;
	Mon, 20 Jul 2026 18:40:45 +0800 (CST)
Subject: Re: [PATCH v1 2/2] LoongArch: mm: Expand modules virtual address
 space to 2GB
To: Xi Ruoyao <xry111@xry111.site>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
 <20260717075715.25513-3-yangtiezhu@loongson.cn> <alySgaaQen6ZtwSo@kernel.org>
 <ba8b2723b563cd290c5c00fb4ec2402626fba06c.camel@xry111.site>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <38d130e6-7036-e296-e058-433c8ba7a265@loongson.cn>
Date: Mon, 20 Jul 2026 18:40:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ba8b2723b563cd290c5c00fb4ec2402626fba06c.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxTOUr+11qZNMSAA--.34772S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr1UKFW5JF4xXF43ury5KFX_yoWrXF18pF
	45Ga1rCr4kJFn8Ca1xAw1UuFyY93y5CFW5trZxury2vr15Zry09FsrKw15ZFy7Cr1Fyr1U
	KFykXa1UtFyDAabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4oGQDUUUU

On 2026/7/19 下午11:28, Xi Ruoyao wrote:
> On Sun, 2026-07-19 at 12:01 +0300, Mike Rapoport wrote:
>> On Fri, Jul 17, 2026 at 03:57:15PM +0800, Tiezhu Yang wrote:
>>> Frequent "execmem: unable to allocate memory" warnings are observed
>>> during kernel module loading when updating the latest kernel.
>>>
>>> This is because the modules virtual address region on LoongArch is
>>> tightly constrained to 256MB, while ARM64 and RISC-V are natively
>>> configured with a spacious 2GB region.
>>
>> The constraint follows architecture ability to address kernel instructions
>> and data from modules code.
>>
>> I don't know what are loongarch requirements, but I remember that arm64
>> added a layer of relocation support to allow 2G module address space.
> 
> IIUC on LoongArch the size of one module is limited to 256MB, but the
> total size of modules can be up to 2GB, as the module loader creates PLT
> entries for calls across the module boundary.
> 
> I'd seen the "execmem: unable to allocate memory" error loading the
> large amdgpu module.  But after I stripped the amdgpu module those
> warnings gone away.  To me this is very strange: shouldn't the module
> loader just ignore the debug info even if it's not stripped instead of
> requesting execmem for it???

I did the following changes based on the original 7.2-rc4 for debugging:

```
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 46dd8d25a605..5eab1ab8b195 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2972,7 +2972,6 @@ static struct module *layout_and_allocate(struct 
load_info *info, int flags)
          * special cases for the architectures.
          */
         layout_sections(info->mod, info);
-       layout_symtab(info->mod, info);

         /* Allocate and move to the final place */
         err = move_module(info->mod, info);
@@ -3013,9 +3012,6 @@ static int post_relocation(struct module *mod, 
const struct load_info *info)
         percpu_modcopy(mod, (void 
*)info->sechdrs[info->index.pcpu].sh_addr,
                        info->sechdrs[info->index.pcpu].sh_size);

-       /* Setup kallsyms-specific fields. */
-       add_kallsyms(mod, info);
-
         /* Arch-specific module finalizing. */
         return module_finalize(info->hdr, info->sechdrs, mod);
  }
```

With this diff, the "execmem: unable to allocate memory" warnings disappear
completely:

fedora@linux:~/7.2-rc4.git$ dmesg -t | grep "execmem:"
fedora@linux:~/7.2-rc4.git$ readelf -S 
drivers/gpu/drm/amd/amdgpu/amdgpu.ko | grep -A 1 -E "debug_info|symtab"
   [23] .debug_info       PROGBITS         0000000000000000  00b73fa9
        000000000bfde1bc  0000000000000000           0     0     1
   [24] .rela.debug_info  RELA             0000000000000000  280f2e40
        0000000011f754a8  0000000000000018   I      75    23     8
--
   [75] .symtab           SYMTAB           0000000000000000  18934e78
        000000000f1a0dd8  0000000000000018          76   10548226     8

This test proves that the "execmem: unable to allocate memory" warning is
entirely triggered by the massive unstripped .symtab section (~241.63 MB)
rather than the debug sections themselves.

As the readelf data shows, the ~500MB debug sections remain fully present
in the static file, yet the memory allocation succeeds without any errors.

This confirms that the generic loader successfully ignores non-SHF_ALLOC
sections during layout_sections().

However, layout_symtab() must put the massive .symtab into memory to
support kallsyms and oops backtraces. Combined with the driver core code,
the total memory request reaches ~252.86 MB. This immediately triggers
allocation failures because 252.86 MB is too close to the narrow 256MB
limit on LoongArch, especially when virtual memory fragmentation exists.

We cannot strip modules or remove layout_symtab() because we need
backtrace symbols for debugging. Therefore, the ~252MB memory demand is
a hard requirement, and expanding MODULES_END to 2GB is necessary for
large modern drivers on LoongArch.

Thanks,
Tiezhu

