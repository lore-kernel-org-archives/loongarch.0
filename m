Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA58C5CA5
	for <loongarch@lists.linux.dev>; Wed, 10 Aug 2022 06:29:55 +0000 (UTC)
Received: from [192.168.100.8] (unknown [112.20.110.237])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxvyNgUPNi2AQMAA--.7073S3;
	Wed, 10 Aug 2022 14:29:53 +0800 (CST)
Message-ID: <10a10e7a-5af1-562e-4812-ff8cb826d3ef@loongson.cn>
Date: Wed, 10 Aug 2022 14:29:53 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] LoongArch: Add I14 description in documentation
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org
References: <1660111423-24633-1-git-send-email-yangtiezhu@loongson.cn>
From: YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <1660111423-24633-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9DxvyNgUPNi2AQMAA--.7073S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWry8ArWxtFy5Xr4UGr47CFg_yoW5Jw17pF
	yvkrWfXF1Uury7KaykJw47GF17JF1xWa17CF1rJr18WrsxAws5KF1xtryqva4xGw10yFWI
	qr4rKryYyFySy3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
	bIxvr21lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JU-J5rUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/


在 2022/8/10 14:03, Tiezhu Yang 写道:
> I14 is also immediate operand, like I8/I12/I16/I21/I26.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> v2: Modify the Chinese documentation.
>
>   Documentation/loongarch/introduction.rst                    | 2 +-
>   Documentation/translations/zh_CN/loongarch/introduction.rst | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Hi Tiezhu


You can split it into two patches， i.e. one for English and one for 
Chinese.


Thanks,

Yanteng


>
> diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
> index 216b3f3..6c9160c 100644
> --- a/Documentation/loongarch/introduction.rst
> +++ b/Documentation/loongarch/introduction.rst
> @@ -221,7 +221,7 @@ I26         Opcode + I26L + I26H
>   =========== ==========================
>   
>   Rd is the destination register operand, while Rj, Rk and Ra ("a" stands for
> -"additional") are the source register operands. I8/I12/I16/I21/I26 are
> +"additional") are the source register operands. I8/I12/I14/I16/I21/I26 are
>   immediate operands of respective width. The longer I21 and I26 are stored
>   in separate higher and lower parts in the instruction word, denoted by the "L"
>   and "H" suffixes.
> diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/loongarch/introduction.rst
> index 11686ee..128878f 100644
> --- a/Documentation/translations/zh_CN/loongarch/introduction.rst
> +++ b/Documentation/translations/zh_CN/loongarch/introduction.rst
> @@ -190,8 +190,8 @@ I26         Opcode + I26L + I26H
>   =========== ==========================
>   
>   Opcode是指令操作码，Rj和Rk是源操作数（寄存器），Rd是目标操作数（寄存器），Ra是
> -4R-type格式特有的附加操作数（寄存器）。I8/I12/I16/I21/I26分别是8位/12位/16位/
> -21位/26位的立即数。其中较长的21位和26位立即数在指令字中被分割为高位部分与低位
> +4R-type格式特有的附加操作数（寄存器）。I8/I12/I14/I16/I21/I26分别是8位/12位/14位/
> +16位/21位/26位的立即数。其中较长的21位和26位立即数在指令字中被分割为高位部分与低位
>   部分，所以你们在这里的格式描述中能够看到I21L/I21H和I26L/I26H这样带后缀的表述。
>   
>   指令列表

